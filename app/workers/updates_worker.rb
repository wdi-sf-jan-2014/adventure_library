class UpdatesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly.minute_of_hour(15, 45) }

  def perform
    libraries = Library.all
    libraries.each do |library|
      Library.create(library.url)
    end
  end

end