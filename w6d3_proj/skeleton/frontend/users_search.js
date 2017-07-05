class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$ul = this.$el.find(".users");
    this.$input = this.$el.find("input[name=username]");

    
  }
}
