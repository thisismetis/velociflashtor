var max = max || null;
var index = 0;
$(document).ready(function(){
  show_card(index);
  disable_buttons(index, max);

  $("#flip-button").click(function() {
    flip_card(index);
    });

  $("#next-button").click(function() {
    hide_card(index);
    index += 1;
    show_card(index);
    disable_buttons(index, max);
  });


  $("#previous-button").click(function() {
    hide_card(index);
    index -= 1;
    show_card(index);
    disable_buttons(index, max);
  });
});

function flip_card(index) {
  $("[data-index="+ index +"] .back").toggle();
  $("[data-index="+ index +"] .front").toggle();
};

function hide_card(index) {
  $("[data-index=" + index + "]").hide();
  $("[data-index=" + index + "] .front").hide();
  $("[data-index=" + index + "] .back").hide();
};

function show_card(index) {
  $("[data-index="+ index +"]").show();
  $("[data-index=" + index + "] .front").show();
};

function disable_buttons(index, max) {
  if(index == 0) {
    $("#previous-button").prop('disabled', true);
  }
  else {
    $("#previous-button").prop('disabled', false);
  }

  if(index == max) {
    $("#next-button").prop('disabled', true);
    $('#finish-button').show();
  }
  else {
    $("#next-button").prop('disabled', false);
  }
};
