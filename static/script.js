const cells = document.querySelectorAll('.cell');
const resetBtn = document.getElementById('reset');
let gameOver = false;
let winnerColor = "#DDD";

// Render the board and optionally highlight the winning line
function renderBoard(board, winningLine = []) {
    cells.forEach(cell => {
        cell.style.backgroundColor = "#FFF";  // Reset background
        cell.textContent = "";                 // Reset content
    });

    for (let r = 0; r < 3; r++) {
        for (let c = 0; c < 3; c++) {
            const cell = document.querySelector(`.cell[data-row='${r}'][data-col='${c}']`);
            if (board[r][c] === 1) cell.textContent = "X";
            else if (board[r][c] === 2) cell.textContent = "O";
        }
    }

    // Highlight winning line if any
    winningLine.forEach(([r, c]) => {
        const cell = document.querySelector(`.cell[data-row='${r}'][data-col='${c}']`);
        cell.style.backgroundColor = winnerColor;
    });
}

// Handle a player click
cells.forEach(cell => {
    cell.addEventListener('click', () => {
        if (gameOver) return;

        const row = parseInt(cell.dataset.row);
        const col = parseInt(cell.dataset.col);

        fetch("/move", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ row, col })
        })
        .then(res => res.json())
        .then(data => {
            // Set the winner color based on outcome
            if (data.winner === 1) winnerColor = "green";
            else if (data.winner === 2) winnerColor = "red";
            else winnerColor = "#DDD";

            // Render board with winning line if any
            renderBoard(data.board, data.winning_line);

            // Handle game over
            if (data.winner) {
                gameOver = true;
                setTimeout(() => { alert(data.winner === 1 ? "You win!" : "AI wins!"); }, 50);
            } else if (data.draw) {
                gameOver = true;
                winnerColor = "#CCC";  // Grayish for draw
                renderBoard(data.board, []);  // No highlight
                setTimeout(() => { alert("It's a draw!"); }, 50);
            }
        });
    });
});

// Handle reset
resetBtn.addEventListener('click', () => {
    fetch("/reset", { method: "POST" })
    .then(res => res.json())
    .then(data => {
        // Reset everything
        renderBoard(data.board, []);   // Empty board
        gameOver = false;              // Allow new game
        winnerColor = "#DDD";          // Default highlight
    });
});




