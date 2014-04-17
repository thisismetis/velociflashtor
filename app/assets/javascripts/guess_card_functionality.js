function process_next_card(index) {
  $('#guess_current_card').prop('value',card_ids[index]);
  $('#guess_next_card').prop('value',card_ids[index+1]);
  $('#guess_deck_id').prop('value', deck_id);
  return index += 1;
};
