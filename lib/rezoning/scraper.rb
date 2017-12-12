require 'nokogiri'
require 'open-uri'
require 'pry'

class Rezoning::Scraper
  def scrape_year_url
    doc = Nokogiri::HTML(open("http://charlottenc.gov/planning/Rezoning/Pages/Home.aspx"))
    binding.pry
# url for year = doc.css(".dfwp-list a")[0].attribute("href").value
#              = "/planning/Rezoning/RezoningPetitions/2017Petitions/Pages/default.aspx"
  end
end
