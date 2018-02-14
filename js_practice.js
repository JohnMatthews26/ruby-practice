function sayHi(name){
  let message = `Hi ${name}!`;
  function greeting() {
    console.log(message);
  }
  return greeting;
}
let sayHiToJohn = sayHi("John");
console.log(sayHi("John"));
console.log(sayHiToJohn());
sayHiToJohn();
