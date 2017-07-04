class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $liEl = $('.cell');
    $liEl.click((event) => {
      let pos = $(event.currentTarget).data("pos");
      this.game.playMove([Math.floor(pos/3),pos%3]);
      this.makeMove($(event.currentTarget));
      if (this.game.isOver()) {
        console.log("over");
        $liEl.off();
      }
      }
    );

  }

  makeMove(square) {
    let mark = this.game.currentPlayer;
    console.log(square);
    square.addClass(`${mark}`);
  }

  setupBoard() {
    const $ul = $('<ul>');
    for (let i = 0; i < 9; i++) {
      const $li = $('<li class="cell">');
      $li.data("pos",i);
      $ul.append($li);
    }
    this.$el.append($ul);
  }
}

module.exports = View;
