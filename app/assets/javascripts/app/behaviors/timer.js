Retrospective.Behaviors.Timer = function(container){
  var hours = 1;
  var later = hours.hour().fromNow();
  container.countdown({
    until: later
  });
};
