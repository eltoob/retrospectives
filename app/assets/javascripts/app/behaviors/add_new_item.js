Retrospective.Behaviors.AddNewItem = function(button) {
  var form = button.closest("form")

  form.ajaxForm(function(response){
    var listOfItems = form.closest(".swimming-lane").find(".items");
    listOfItems.append(response);

    var newItemInput = listOfItems.find(".retro-item:last")
    Retrospective.Behaviors.Keybindings(newItemInput);
    Retrospective.Behaviors.AjaxForm(newItemInput.closest('form'));
    newItemInput.focus();

    return false;
  });

  button.click(function(){
    form.submit();
    return false;
  });
};
