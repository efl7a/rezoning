require 'nokogiri'
require 'open-uri'
require 'pry'

class Rezoning::Scraper
  BASE_CHARLOTTE_GOV_WEBSITE = "http://charlottenc.gov"
  def scrape_year_url
    doc = Nokogiri::HTML(open("#{BASE_CHARLOTTE_GOV_WEBSITE}/planning/Rezoning/Pages/Home.aspx"))
    # url for year = doc.css(".dfwp-list a")[0].attribute("href").value
#              = "/planning/Rezoning/RezoningPetitions/2017Petitions/Pages/default.aspx"
    doc.css(".dfwp-list a").map do |element|
      element.attribute("href").value
    end
  end
  def scrape_petitions
  #  self.scrape_year_url.each do |year|
  #    doc = Nokogiri::HTML(open("#{BASE_CHARLOTTE_GOV_WEBSITE}#{year}"))
  # The city has changed the way they format the petitions from year to year.  For now, this will just allow for the 2017 petitions.
      doc = Nokogiri::HTML(open("#{BASE_CHARLOTTE_GOV_WEBSITE}#{self.scrape_year_url[0]}"))
      rows = doc.css("tr")
      rows[2..-1].each do |petition|
        if petition.css("td a") != nil
          current_petition = Rezoning::Petition.new(petition.css("td a").attribute("href").value)
          current_petition.number = petition.css("td")[0].text unless petition.css("td")[0] == nil
          current_petition.petitioner = petition.css("td")[1].text unless petition.css("td")[1] == nil
          current_petition.description = petition.css("td")[2].text unless petition.css("td")[2] == nil
          current_petition.current_zoning = petition.css("td")[2].text unless petition.css("td")[3] == nil
          current_petition.proposed_zoning = petition.css("td")[4].text unless petition.css("td")[4] == nil
          current_petition.decision = petition.css("td")[5].text unless petition.css("td")[5] == nil
          current_petition.decision_date = petition.css("td")[6].text unless petition.css("td")[6] == nil
          district_info = petition.css("td")[7].text unless petition.css("td")[7] == nil
          #"District-Councilperson"
          current_petition.district = district_info.split("-")[0] unless district_info == nil
          current_petition.councilperson = district_info.split("-")[1] unless district_info == nil
       end
      end
  #  end
  end
end
