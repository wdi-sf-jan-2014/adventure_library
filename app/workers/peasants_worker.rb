class PeasantsWorker
	include Sidekiq::Worker

	def perform(library_id)
		new_library = Library.find(library_id)
		response = Typhoeus.get("#{new_library.url}adventures.json")
        result = JSON.parse(response.body)
        result["adventures"].each do |adventure|
          obtained_adventure = new_library.adventures.create!(:title => adventure["title"], :author => adventure["author"], :guid => adventure["guid"])
      
            adventure["pages"].each do |page|
              obtained_pages = obtained_adventure.pages.create!(:name => page["name"], :text => page["text"])
            end
        end
	end
end