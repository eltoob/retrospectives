Retrospective.Behaviors.Timer = function(container){
  var seconds = container.data('seconds-left');
  var retros_path = container.data("retros-path");
  var later = seconds.seconds().fromNow();

  var save = function(val){
    hours_left = val[4] * 60 * 60;
    minutes_left = val[5] * 60;
    seconds_left = val[6];

    total_seconds_left = hours_left + minutes_left + seconds_left;
    $.post(retros_path, {_method: 'put', retro: {seconds_left: total_seconds_left}})
  };

  container.countdown({
    until: later,
    onTick: save,
    tickInterval: 5
  });
};
