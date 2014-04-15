class GoogleSearch

  def self.google_search(query, num = 3)
    google_search = Google::Search::Image.new(query: query)
    results = google_search.response
    images = results.map(&:uri)
    images[0..(num - 1)]
  end

end
