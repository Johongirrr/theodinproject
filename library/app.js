  
let myLibrary = [];

function Book(title, author, pages, isRead){
  this.title = title;
  this.author = author;
  this.pages = pages;
  this.isRead = isRead;
}

Book.prototype.toggleIsRead = function(){
  this.isRead = !this.isRead;
}

function addBookToLibrary(e) {
  const title = document.getElementById('title').value;
  const author = document.getElementById('author').value;
  const pages = document.getElementById('pages').value;
  const isRead = document.getElementById('isRead').checked;
  const book = new Book(title, author, pages, isRead);
  myLibrary.push(book);
  render(); 
}


function render() {
  let tempElems = [];
  let libraryElem = document.getElementById('books');
  libraryElem.innerHTML = '';
  myLibrary.forEach(function(book, index){
      const readStr = book.isRead ? 'already read it' : 'not read yet';
      const isChecked = book.isRead ? 'checked' : '';
      let card = `<div data-index="${index}">
        <h2>${book.title}</h2>
          <p>by ${book.author}</p>
          <p>pages: ${book.pages}</p>
          <p>${readStr}</p>
          <label>I read it </label> 
          <input type='checkbox' name='status' id='status' ${isChecked} onclick='${book.toggleIsRead()}' />
          <button onclick='removeBook(${index})'>Remove</button>
      </div>`;    

    tempElems.push(card);
    resetInputs();
  });
  libraryElem.innerHTML = tempElems;
}

function resetInputs(){
  let inputs = ['title', 'author', 'pages'];
  inputs.forEach(function(input){
    document.getElementById(input).value = '';
  });
  document.getElementById('isRead').checked = false;

}

function removeBook(index) {
  myLibrary.splice(index, 1);
  render();
}

render();