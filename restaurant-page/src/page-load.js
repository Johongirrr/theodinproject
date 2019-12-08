

const initPage = (data) => {
  const { title, tagline, image, text } = data;

  let titleElm = document.createElement('h1');
  titleElm.innerText = title;
  
  let taglineElm = document.createElement('h2');
  taglineElm.innerText = tagline
  
  let imageElm = document.createElement('img');
  imageElm.src = image.src;
  imageElm.title = image.title
  imageElm.alt = image.title

  let pElm = document.createElement('p');
  pElm.innerText = text;

  return { titleElm, taglineElm, imageElm, pElm };
};


module.exports = initPage;