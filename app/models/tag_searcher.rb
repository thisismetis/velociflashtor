class TagSearcher

  def initialize(query)
    @query = query
  end

  def tags
    Tag.where('name ILIKE ?', "%#{query}%")
  end

  private

  attr_reader :query

end
