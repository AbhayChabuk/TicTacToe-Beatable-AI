from flask import Flask, render_template, request, jsonify
import random
import os

# Flask app for AWS EB
application = Flask(__name__)

# Global board: 0=empty, 1=player, 2=AI
board = [[0]*3 for _ in range(3)]

# ---------------- Game Logic ---------------- #
def check_win(player, b=None):
    if b is None:
        b = board
    for i in range(3):
        # rows and columns
        if all(b[i][j] == player for j in range(3)):
            return True
        if all(b[j][i] == player for j in range(3)):
            return True
    # diagonals
    if all(b[i][i] == player for i in range(3)):
        return True
    if all(b[i][2-i] == player for i in range(3)):
        return True
    return False

def get_winning_line(player):
    for i in range(3):
        # rows
        if all(board[i][j] == player for j in range(3)):
            return [(i, j) for j in range(3)]
        # columns
        if all(board[j][i] == player for j in range(3)):
            return [(j, i) for j in range(3)]
    # diagonals
    if all(board[i][i] == player for i in range(3)):
        return [(i, i) for i in range(3)]
    if all(board[i][2-i] == player for i in range(3)):
        return [(i, 2-i) for i in range(3)]
    return []

def is_board_full():
    return all(cell != 0 for row in board for cell in row)

def ai_move():
    # 1. Win if possible
    for r in range(3):
        for c in range(3):
            if board[r][c] == 0:
                board[r][c] = 2
                if check_win(2):
                    return
                board[r][c] = 0
    # 2. Block player
    for r in range(3):
        for c in range(3):
            if board[r][c] == 0:
                board[r][c] = 1
                if check_win(1):
                    board[r][c] = 2
                    return
                board[r][c] = 0
    # 3. Take center
    if board[1][1] == 0:
        board[1][1] = 2
        return
    # 4. Random corner
    corners = [(0,0), (0,2), (2,0), (2,2)]
    random.shuffle(corners)
    for r, c in corners:
        if board[r][c] == 0:
            board[r][c] = 2
            return
    # 5. Any empty
    empty = [(r, c) for r in range(3) for c in range(3) if board[r][c] == 0]
    if empty:
        r, c = random.choice(empty)
        board[r][c] = 2

# ---------------- Routes ---------------- #
@application.route("/")
def index():
    return render_template("index.html")

@application.route("/move", methods=["POST"])
def move():
    global board
    data = request.json
    r, c = data['row'], data['col']
    winner = 0
    winning_line = []
    draw = False

    # Validate move
    if board[r][c] != 0:
        return jsonify({
            "board": board,
            "winner": winner,
            "winning_line": winning_line,
            "draw": draw
        })

    board[r][c] = 1  # Player move

    # 1️⃣ Check player win
    if check_win(1):
        winner = 1
        winning_line = get_winning_line(1)
    # 2️⃣ AI moves only if player didn't win and board not full
    elif not is_board_full():
        ai_move()
        if check_win(2):
            winner = 2
            winning_line = get_winning_line(2)

    # 3️⃣ Check draw
    if is_board_full() and winner == 0:
        draw = True

    return jsonify({
        "board": board,
        "winner": winner,
        "winning_line": winning_line,
        "draw": draw
    })

@application.route("/reset", methods=["POST"])
def reset():
    global board
    board = [[0]*3 for _ in range(3)]
    return jsonify({
        "board": board,
        "winner": 0,
        "winning_line": [],
        "draw": False
    })

if __name__ == "__main__":
    application.run(host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))






