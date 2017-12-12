class Rezoning::Petition
  attr_accessor :number, :website, :petitioner, :decision, :decision_date, :description, :current_zoning, :proposed_zoning, :district, :councilperson
  @@all = []
    def initialize(url)
      @website = url
      @@all << self unless @@all.include?(self)
    end

    def self.find_by_number(number)
      self.all.find(number)
    end

    def display
      puts "#{self.number}".colorize(:blue)
      puts "  petitioner:".colorize(:light_blue) + " #{self.petitioner}"
      puts "  website:".colorize(:light_blue) + " #{self.websit}"
      puts "  description:".colorize(:light_blue) + " #{self.description}"
      puts "  district:".colorize(:light_blue) + " #{self.district}"
      puts "  petitioner:".colorize(:light_blue) + " #{self.petitioner}"
      puts "  district:".colorize(:light_blue) + " #{self.district}"
      puts "  decision:".colorize(:light_blue) + " #{self.decision}"
      puts "  decision date:".colorize(:light_blue) + " #{self.district}"
    end

    def self.display_by_district(input)
      self.class.all.each do |petition|
        if petition.district == input
          petition.display
          puts "----------------------".colorize(:green)
        end
      end
    end

    def self.display_by_petitioner(input)
      self.class.all.each do |petition|
        if petition.petitioner == input
          petition.display
          puts "----------------------".colorize(:green)
        end
      end
    end

    def self.all
      @@all
    end
end
