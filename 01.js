function Book(title, author, pages = 0, isRead = false){
    this.title = title;
    this.author = author;
    this.pages = pages;
    this.isRead = isRead;

    this.info = function () {
        const readStr = this.isRead? 'already read it' : 'not read yet';
        return `${this.title} by ${this.author}, ${this.pages} pages, ${readStr}`
    }
}


const book = new Book('The Hobbit', 'J.R.R. Tolkien', 295);

console.log(book.info());