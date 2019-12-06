
const gameBoard = (() => {
  let game = {
    0: '', 1:'', 2:'',
    3: '', 4:'', 5:'',
    6: '', 7:'', 8:'',
  };

  const add = (index, marker) => {
    if(game[index].length === 0){
      game[index] = marker;
      return true;
    }

    return false;
  }
  const getBoard = () => game;
  const initBoard = () => {
    game = {
      0: '', 1:'', 2:'',
      3: '', 4:'', 5:'',
      6: '', 7:'', 8:'',
    };
  }
  return { add, getBoard, initBoard}; 
})();


const Player = function(name, marker){

  const _marker = marker;
  const _name   = name;

  const addMarker = function(gameBoard, index){
    return gameBoard.add(index, _marker);
  };

  return { addMarker, name, marker }; 
}

let playerOne = new Player('Player One', 'x');
let playerTwo = new Player('Player Two', 'o');

let currentPlayer = playerOne;

const isGameOver = (gameBoard) => {
  const board = gameBoard.getBoard();

  for(let place in board){
    if(board[place] === ''){
      return false;
    }
  }
  return true;
};

const isWinnerRows = (gameBoard) => {
  // check if the one row is full of the X or O
  if(gameBoard[1] != '' && gameBoard[0] === gameBoard[1] && gameBoard[1] === gameBoard[2]){
    return true;
  }
  if(gameBoard[4] != '' && gameBoard[3] === gameBoard[4] && gameBoard[4] === gameBoard[5]){
    return true;
  }
  if(gameBoard[7] != '' && gameBoard[6] === gameBoard[7] && gameBoard[7] === gameBoard[8]){
    return true;
  }

  return false;
};

const isWinnerColumns = (gameBoard) => {
  // check if the one row is full of the X or O
  if(gameBoard[3] != '' && gameBoard[0] === gameBoard[3] && gameBoard[3] === gameBoard[6]){
    return true;
  }
  if(gameBoard[4] != '' && gameBoard[1] === gameBoard[4] && gameBoard[4] === gameBoard[7]){
    return true;
  }
  if(gameBoard[5] != '' && gameBoard[2] === gameBoard[5] && gameBoard[5] === gameBoard[8]){
    return true;
  }

  return false;
};


const isWinnerDiagonal = (gameBoard) => {
  if( gameBoard[4] != '' && gameBoard[0] === gameBoard[4] && gameBoard[4] === gameBoard[8]){
    return true;
  }
  if( gameBoard[4] != '' && gameBoard[2] === gameBoard[4] && gameBoard[4] === gameBoard[6]){
    return true;
  }

  return false;
};

// DOM Manipulation

let markerPlaces = document.querySelectorAll('.marker-place');
let whosPlaying = document.querySelector('.whos-playing');
let startBtn = document.querySelector('#start');
let gameOver = false;

const reset = () => {
  gameBoard.initBoard(); 
  currentPlayer = playerOne;
  whosPlaying.innerHTML = currentPlayer.name;
  // render();
};

startBtn.addEventListener('click', function(){
  reset();
  render();
});

const checkWinner = (gameBoard) => {
  return isWinnerColumns(gameBoard) || isWinnerRows(gameBoard) || isWinnerDiagonal(gameBoard);
};


markerPlaces.forEach(markerPlace => {

  markerPlace.addEventListener('click', function(){
    const index = markerPlace.attributes['data-index'].value;
    if(currentPlayer.addMarker(gameBoard, index)){
      currentPlayer = (currentPlayer.name === playerOne.name) ? playerTwo : playerOne;
    }
   
  whosPlaying.innerHTML = currentPlayer.name;
  render();

  if(checkWinner(gameBoard.getBoard())){
    alert('The winnser is ' + currentPlayer.name);
    reset();
    return;
  }

  if(isGameOver(gameBoard)){
    alert('The game is over with draw');
    reset();
    return;
  }

  });
});

function render() {
  const board = gameBoard.getBoard();
  markerPlaces.forEach(markerPlace => {
    const index = markerPlace.attributes['data-index'].value;
    markerPlace.innerHTML =  board[index];
  });
}


render();