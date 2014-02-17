class LibrariesWorker
  include Sidekiq::Worker

  # def get_libraries library_url
  #   library = Library.find_by(url: library_url)
  #   request = library.url+"/libraries.json"
  #   response = JSON.parse(Typhoeus.get(request).body)
  #   response['libraries'].each do |lib|
  #     unless Library.find_by(url: lib.url)
  #       Library.create(lib)
  #     end
  #     get_libraries(lib.url)
  #   end
  # end


  def get_libs (url)
    response = JSON.parse(Typhoeus.get(url+"/libraries.json").body)['libraries']
    unless Library.find_by(url: url)
      Library.create(url: url)
    end
    response.each do |lib|
    get_libs(lib['url'])
    end
  end


end