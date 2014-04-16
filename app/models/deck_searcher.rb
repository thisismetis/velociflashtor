class DeckSearcher

  def initialize(query)
    @query = query
  end

  def decks
    find_decks_by_name_and_tags
  end

  private

  attr_reader :query

  def find_decks_by_name_and_tags
    Deck.where(search_sql, query: "%#{query}%", deck_ids: deck_ids_from_tags)
  end

  def search_sql
    'name ILIKE :query OR id IN (:deck_ids)'
  end

  def deck_ids_from_tags
    Tagging.where(tag_id: tags).pluck(:deck_id)
  end

  def tags
    tag_searcher.tags
  end

  def tag_searcher
    TagSearcher.new(query)
  end

end
