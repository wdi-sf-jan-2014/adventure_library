class OrcsWorker
	include Sidekiq::Worker

	def perform(library_id)
	new_library = Library.find(library_id)
	library_response = Typhoeus.get("#{new_library.url}libraries.json)")
    result_lib = JSON.parse(library_response.body)
	    result_lib["libraries"].each do |library|
			new_library = Library.create(:url => library["url"])
		end
	end
end