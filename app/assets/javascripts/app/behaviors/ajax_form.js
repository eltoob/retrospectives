Retrospective.Behaviors.AjaxForm = function(form){
  form.ajaxForm();
  var timeoutId = null;

  var save = function(){
    if(timeoutId !== null){
      clearTimeout(timeoutId);
    }

    timeoutId = setTimeout(function(){
      form.submit();
    }, 200);
  };

  var inputs = form.find("input[type=text]")
  inputs.keypress(save);
};
