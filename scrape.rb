require 'typhoeus'
require 'json'

def scrape
  response = typhoeus.get("http://adventures-with-raphael.herokuapp.com/adventures.json)
  result = JSON.parse(response)
  puts result.to_s
  
end
