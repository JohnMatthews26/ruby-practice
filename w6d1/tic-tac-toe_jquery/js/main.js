const View = require("./ttt-view"); // require appropriate file
const Game = require("../../tic-tac-toe_node/game");// require appropriate file

$( () => {
  const $el = $("figure.ttt");
  const game = new Game();
  new View(game, $el);
});
