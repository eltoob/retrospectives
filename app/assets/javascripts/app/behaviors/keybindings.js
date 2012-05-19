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
  });
};
