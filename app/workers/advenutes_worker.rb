class AdventuresWorker
  include Sidekiq::Worker

  def perform(site_id)
    require 'open-uri'
