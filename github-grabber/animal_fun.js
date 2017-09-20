const fs = require('fs');


var array = fs.readFileSync('./animals.txt').toString().split("\n");

let valid = [];

let userInput = process.argv[2].toUpperCase();

array.forEach(function(el){

  if (el[0] === userInput) {
    valid.push(el);
  }
});

fs.writeFile(`./${userInput}_animals.txt`, `${valid}`, err => {
  if (err) {
    console.log(err);
  } else {
    console.log("file successfully written!");
  }
});
