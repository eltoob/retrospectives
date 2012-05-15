Retrospective.Behaviors.ShowHappyItems = function(el){
  el.click(function(){
    var actionItems = $("#action_items");
    var happy = $("#happy");

    actionItems.addClass("hide");
    happy.removeClass('hide');

    actionItems.insertAfter($("#bad"));
    happy.insertBefore($("#meh"));

    happy.find(".retro-item").focus();
  });
};
