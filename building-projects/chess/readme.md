### Definition:
Chess is a two-player strategy board game played on a checkered board with 64 squares arranged in an 8×8 grid
### 16 pieces:
* 1 king : 1 step horizontally, vertically or diagonally
* 1 queen : any number of steps horizontally, vertically or diagonally
* 2 knights (horse) : 2 vertical steps and 1 horizontal step or 2 horizontal steps and 1 vertical step
* 8 pawns (soliders) : 1 or 2 steps forward and can take the enemie place  
* 2 rooks: any number of steps horizontally or vertically
* 2 bishops: any number of steps diagonally
### setup:
The board is an 8x8 Array, player one position: 
rook 1 in A1 and number 2 in H1
knight 1 in B1 and number 2 in G1
bishop 1 in C1 and number 2 in F1
queen in D1
king in E1
8 pawns in A2, B2, C2, D2, E2 , F2, G2, H2

for the player number 2
rook 1 in A8 and number 2 in H8
knight 1 in B8 and number 2 in G8
bishop 1 in C8 and number 2 in F8
queen in D8
king in E8
8 pawns in A7, B7, C7, D7, E7 , F7, G7, H7 
### workflow 
* the columns should be displayed as a range from A to H and the rows from 8 down to 1
* we should figure out a way to use board.squares[0][0] == board.squares[A][8] where the first 0 is a contant A which represent the column and the second 0 is the 8 and it represents the row, the benift of this repsentation is to make it easy for us to work with the Array
as a board and the user can make movements using a string with two char inpuet ~= /[A-H][1-8]/

1. ask users names
2. the game starts with setting up the pieces positions and displaying the board
3. user enter which move he wants to play from -> to, e.g: B1 A3 
  3.1 we check if the syntax is correct else tells the user the syntax is wrong
  3.2 we check if the piece in B1 is able to do that move? do the move or tells the user he can't move there because of the chess rules
4. check checkmate? game over the winner is the current player else next player trun's
5. current player go to the step 3

GAME END : 
win : The player whose turn it is to move is in check and has no legal move to escape check.
