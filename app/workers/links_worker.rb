class LinksWorker 
  include Sidekiq::Worker 
  include LibrariesHelper

  def perform(library_id)
    
  end 
  # def perform(library_id)
#     @library = Library.find(library_id)
#     adv_response = Typhoeus.get("#{@library.url}/libraries.json")
#     if adv_response != []
#       adv_result = JSON.parse(adv_response.body)
      
#       adv_result["libraries"].each do |library|
#         if Library.where(url: library["url"]) == []
#           Library.create(url: library["url"])
#         end
#       end  
#     end 

#   end  



end 



