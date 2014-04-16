class GoogleSearch

  def initialize(query, num = 3)
    @query = query
    @num = num
  end

  def images
    google_search = Google::Search::Image.new(query: @query)
    results = google_search.response
    images = results.map(&:uri)
    images.take(@num)
  end

end
