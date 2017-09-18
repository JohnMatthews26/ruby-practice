const fs = require('fs');


var array = fs.readFileSync('./animals.txt').toString().split("\n");

let valid = [];

array.forEach(function(el){
  console.log(el[0], process.argv[2]);
  if (el[0] === process.argv[2]) {
    valid.push(el);
  }
});

fs.writeFile(`./${process.argv[2]}_animals.txt`, `${valid}`, err => {
  if (err) {
    console.log(err);
  } else {
    console.log("file successfully written!");
  }
});
//
// fs.writeFile('./{process.argv[2]}_animals.txt', 'I will be written to example.txt', err => {
//   if (err) {
//     console.log(err);
//   } else {
//     console.log("file successfully written!");
//   }
// });
//
// console.log(process.argv);
