module LibrariesHelper

  def scrape(url)
    resp1 = Typhoeus.get("#{url}/libraries.json")
    @foreign_libraries = JSON.parse(resp_1.body)["libraries"]

    resp2 = Typhoeus.get("#{url}/adventures.json")
    @foreign_adventures = JSON.parse(resp1.body)["adventures"]
  end

  def url_cleanup(cleanup_url) #Thank you Kai Hofius!  I need to work through the logic on line 21
    # cleanup_url = self.url
    uri = URI.parse(cleanup_url)

    cleanup_url.downcase!

    cleanup_url = ("http://" + cleanup_url) unless uri.scheme

    # removes everything after the base url =>
    # "http://blah.com/libraries.json" becomse "http://blah.com"
    cleanup_url = cleanup_url.split("/").slice(0,3).join("/")

  end

end
# def create  URI.parse
#     lib = Library.create(url: params[:library][:url])
#     new_adv = Typhoeus.get(params[:library][:url])
#     resp = JSON.parse(new_adv.body)["adventures"]
#     resp.each do |x|
#       adv = lib.adventures.create(title: x["title"], author: x["author"], guid: x["guid"])
#       x["pages"].each do |y|
#         adv.pages.create(name: y["name"], text: y["text"])
#       end
#     end
#     redirect_to libraries_path
#   end