class TagSearcher

  def initialize(search_params)
    @query = search_params[:query]
  end

  def tags
    Tag.where("name ILIKE ?", "%#{query}%")
  end

  private

  attr_reader :query

end
