class GoogleSearch
  include ActiveModel::Model

  def initialize(query, num = 3)
    @query = query
    @num = num
  end

  def images
    if valid?
      google_search = Google::Search::Image.new(query: @query)
      results = google_search.response
      images = results.map(&:uri)
      images.take(num)
    else
      errors.add(:front, 'front cannot empty')
      false
    end
  end

  def valid?
    query != ''
  end

  private

  attr_reader :query, :num

end
