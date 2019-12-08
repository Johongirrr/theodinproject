const pageLoad = require('./page-load');


const content = document.querySelector('#content');
const page = pageLoad({
  title: 'Welcome To The Nasro Restaurant',
  tagline: 'The great Traditional Meals Righ Here',
  text: 'Algerian food noted for its diversity and uniqueness have influences of several cultures like French, Arabic, Ottoman, Berber, and Andalusian. Beef, lamb, fresh herbs, spices, vegetables, and bread form the basis of most of the dishes. Since Islam is one of the main religions practiced, most of the recipes found here have a tinge of Muslim influence. Let us check out the list of top dishes found here.',
  image: {
    src: './images/algerian-food.png',
    title: 'Algerian Food',
  }
});
for(let elm in page){
  content.appendChild(page[elm]);
}
