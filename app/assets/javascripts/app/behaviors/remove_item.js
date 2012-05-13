Retrospective.Behaviors.RemoveItem = function(link) {
  link.click(function(){
    var remove = function(){
      link.closest("form").remove();
    };

    $.ajax({
      url: link.attr("href"),
      type: "POST",
      data: {_method: 'delete'},
      success: remove
    });

    return false;
  });
};
