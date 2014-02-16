class PeasantsWorker
	include Sidekiq::Worker

	def perform (library_id)
		library = Library.find(library_id)
		result = Typhoeus.get(open(library.url))
		binding.pry

	end

end