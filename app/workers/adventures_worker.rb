class AdventuresWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)["url"]
    response_html = Typhoeus.get(library + "adventures.json")
    response_json = JSON.parse(response_html.body)
    response_json["adventures"].each do |adventure|
      if Adventure.find_by(guid: adventure["guid"]) == nil
        Adventure.create!(guid: adventure["guid"], title: adventure["title"], author: adventure["author"])
        if adventure["pages"] != nil #&& adventure["pages"].each { |page| page.find_by(name: "start") } #check for whatever is throwing TypeError
          adventure["pages"].each do |page|
            Page.create!(name: page["name"], text: page["text"])
          end
        end
      end
    end
  end

end