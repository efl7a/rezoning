class Rezoning::Petition
  attr_accessor :number, :website, :petitioner, :decision, :decision_date, :description, :current_zoning, :proposed_zoning, :district, :councilperson
  @@all = []
    def initialize(url)
      @website = url
      @@all << self unless @@all.include?(self)
    end

    def self.all
      @@all
    end
end
