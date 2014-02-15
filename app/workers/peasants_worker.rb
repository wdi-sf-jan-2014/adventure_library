class PeasantsWorker
	include Sidekiq::Worker

	def perform (library_id)
		library = Library.find(library_id)

	end

end