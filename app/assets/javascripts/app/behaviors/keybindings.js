Retrospective.Behaviors.Keybindings = function(item){
  var ENTER = 13;

  item.keyup(function(event){
    if(event.which == ENTER){
      if(item.val().replace(/ /, '').length !== 0){
        var submit = item.closest(".swimming-lane").find(".add-new-item");
        submit.click();
      }
    }
  });
};
