Retrospective.Behaviors.Keybindings = function(item){
  var ENTER = 13;
  var UP_ARROW = 38;
  var DOWN_ARROW = 40;
  var RIGHT_ARROW = 39;
  var LEFT_ARROW = 37;

  var enterPressed = function(){
    if(item.val().replace(/ /, '').length !== 0){
      var submit = item.closest(".swimming-lane").find(".add-new-item");
      submit.click();
    }
  };

  var upArrowPressed = function(){
    var newItem = item.closest("form").prevAll(".retro-item-form:first")

    if(newItem.length > 0) {
      newItem.find(".retro-item").focus();
    }
  };

  var downArrowPressed = function(){
    var newItem = item.closest("form").nextAll(".retro-item-form:first")

    if(newItem.length > 0) {
      newItem.find(".retro-item").focus();
    }
  };

  var leftArrowPressed = function(){
    var newItem = item.closest(".swimming-lane").prev();

    if(newItem.length > 0) {
      newItem.find(".retro-item:first").focus();
    }
  };

  var rightArrowPressed = function(){
    var newItem = item.closest(".swimming-lane").next();

    if(newItem.length > 0) {
      newItem.find(".retro-item:first").focus();
    }
  };

  item.keyup(function(event){
    if(event.which == ENTER){
      enterPressed();
    }

    if(event.which == UP_ARROW){
      upArrowPressed();
    }

    if(event.which == DOWN_ARROW){
      downArrowPressed();
    }

    if(event.which == LEFT_ARROW){
      leftArrowPressed();
    }

    if(event.which == RIGHT_ARROW){
      rightArrowPressed();
    }
  });
};
