Retrospective.Behaviors.RemoveItem = function(link) {
  link.click(function(){
    var remove = function(){
      link.closest("form").remove();
    };

    $.post(link.attr("href"), {_method: 'delete', success: remove});

    return false;
  });
};
