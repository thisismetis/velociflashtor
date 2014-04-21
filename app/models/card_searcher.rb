class CardSearcher
  def initialize(query)
    @query = query
  end

  def cards
    find_cards_by_front
  end

  private

  attr_reader :query

  def find_cards_by_front
    Card.where(search_sql, query: "%#{query}%")
  end

  def search_sql
    'front ILIKE :query'
  end

end
