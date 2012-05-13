Retrospective.Behaviors.Keybindings = function(container){
  var ENTER = 13;

  container.find(".retro-item").each(function(){
    var el = $(this);
    el.keyup(function(event){
      if(event.which == ENTER){
        var submit = el.closest(".swimming-lane").find(".add-new-item");
        submit.click();
      }
    });
  });
};
