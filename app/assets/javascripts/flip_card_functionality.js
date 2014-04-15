var index = 0;
$(document).ready(function(){
  $("[data-index=" + index + "]").show();
  $("[data-index=" + index + "] .front").show();
  $("#flip-button").click(function() {
    $("[data-index="+ index +"] .back").toggle();
    $("[data-index="+ index +"] .front").toggle();
    });

  $("#next-button").click(function() {
    $("[data-index="+ index +"]").toggle();
    index += 1;
    $("[data-index="+ index +"]").toggle();
    $("[data-index=" + index + "] .front").show();
    });

  $("#previous-button").click(function() {
    $("[data-index="+ index +"]").toggle();
    index -= 1;
    $("[data-index="+ index +"]").toggle();
    $("[data-index=" + index + "] .front").show();
    });
  });
