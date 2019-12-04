let head = {
  glasses: 1
};

let table = {
  __proto__: head,
  pen: 3
};

let bed = {
    __proto__: table,
  sheet: 1,
  pillow: 2
};

let pockets = {
  __proto__: bed,
  money: 2000
};

console.log('pockets.pen: ', pockets.pen);
console.log('bed.glasses: ', bed.glasses);
// is it faster to get glasses as pockets.glasses or head.glasses? 
// answer: head.glasses is faster than pockets.glasses because of the chaining
