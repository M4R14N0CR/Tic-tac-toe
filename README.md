<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body>
  <h1>Tic Tac Toe in Assembly</h1>

  <h2>Overview</h2>
  <p>
    This project implements the classic Tic Tac Toe game using assembly language (NASM). It demonstrates low-level programming by handling console output and input directly, and by managing the game logic at the assembly level.
  </p>

  <h2>Game Description</h2>
  <p>
    The game features a 3x3 board where two players take turns placing their markers: 'X' for Player 1 and 'O' for Player 2. The program updates the board in real time and checks for a winning condition (three identical markers in a row, column, or diagonal) or a draw when all positions are filled without a winner.
  </p>

  <h2>Implementation Details</h2>
  <ul>
    <li>
      <strong>Console Output and Colors:</strong> The code uses ANSI escape codes to change text color in the terminal, enhancing the visual feedback for messages and board updates.
    </li>
    <li>
      <strong>Board Representation:</strong> The board is stored as character arrays representing each row. Specific positions within these rows are updated with 'X' or 'O' as players make their moves.
    </li>
    <li>
      <strong>User Input Handling:</strong> The program reads coordinate input from the user, validates that the chosen cell is empty, and then places the corresponding marker.
    </li>
    <li>
      <strong>Game Logic and Flow:</strong> The assembly code is organized into procedures that manage:
      <ul>
        <li>Resetting the board to an initial state.</li>
        <li>Prompting each player for input.</li>
        <li>Updating the board and variables that represent the board state.</li>
        <li>Checking for a win or a draw after each move.</li>
      </ul>
    </li>
    <li>
      <strong>Restart Capability:</strong> If the ESC key is pressed, the game resets the board, allowing a new game to start.
    </li>
  </ul>

  <h2>Conclusion</h2>
  <p>
    Overall, this project is a great example of implementing interactive game logic entirely in assembly language. It highlights how to manipulate memory directly, use low-level I/O for console operations, and build a complete game loop in a minimalistic programming environment.
  </p>
</body>
</html>
