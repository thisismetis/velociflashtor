function process_next_card(index) {
  $('#guess_current_card').prop('value', card_ids[index]);
  $('#guess_next_card').prop('value', card_ids[index + 1]);
  $('#guess_deck_id').prop('value', deck_id);
  $('#guess_guess_bank').val(guess_bank);
  $('#guess_last_card').val(last_card_id);
  return index += 1;
};
