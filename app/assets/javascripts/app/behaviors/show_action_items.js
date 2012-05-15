Retrospective.Behaviors.ShowActionItems = function(el){
  el.click(function(){
    var actionItems = $("#action_items");
    var happy = $("#happy");

    happy.addClass("hide");
    actionItems.removeClass('hide');
    actionItems.insertBefore($("#meh"));
    happy.insertAfter($("#bad"));
    actionItems.find(".retro-item").focus();
  });
};
