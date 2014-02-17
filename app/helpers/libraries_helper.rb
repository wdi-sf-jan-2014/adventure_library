module LibrariesHelper
  def adventure_scrape(url)
    response = Typhoeus.get(url)
    result = JSON.parse(response.body)

    result["adventures"].each do |adventure|
      unless Adventure.find_by(library_id: a["library_id"])

      end
    end

  end
end


