$(document).ready(function() {
  var categories = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    limit: 10,
    prefetch: {
      url: 'categories.json',
      filter: function(list) {
        return $.map(list, function(category) { return { name: category }; });
      }
    }
  });

  categories.initialize();

  $('.typeahead').typeahead(null, {
    name: 'categories',
    displayKey: 'name',
    source: categories.ttAdapter()
  });
});
