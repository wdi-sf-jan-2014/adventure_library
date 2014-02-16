module LibrariesHelper

  def scrape(url)
    resp_1 = Typhoeus.get("#{url}/libraries.json")
    @foreign_libraries = JSON.parse(response.body)["libraries"]

    resp_2 = Typhoeus.get("#{url}/adventures.json")
    @foreign_adventures = JSON.parse(response.body)["adventures"]
  end

end
def create
    lib = Library.create(url: params[:library][:url])
    new_adv = Typhoeus.get(params[:library][:url])
    resp = JSON.parse(new_adv.body)["adventures"]
    resp.each do |x|
      adv = lib.adventures.create(title: x["title"], author: x["author"], guid: x["guid"])
      x["pages"].each do |y|
        adv.pages.create(name: y["name"], text: y["text"])
      end
    end
    redirect_to libraries_path
  end