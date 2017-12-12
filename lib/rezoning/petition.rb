require 'colorize'

class Rezoning::Petition
  attr_accessor :number, :website, :petitioner, :decision, :decision_date, :description, :current_zoning, :proposed_zoning, :district, :councilperson
  @@all = []
    def initialize(url)
      @website = url
      @@all << self unless @@all.include?(self)
    end

    def self.find_by_number(number)
      puts "#{self.all.find{|petition| petition.number == number}}"
      self.all.find{|petition| petition.number == number}
    end

    def display
      puts "#{self.number}".colorize(:blue)
      puts "  petitioner:".colorize(:light_blue) + " #{self.petitioner}"
      puts "  website:".colorize(:light_blue) + " #{self.website}"
      puts "  description:".colorize(:light_blue) + " #{self.description}"
      puts "  district:".colorize(:light_blue) + " #{self.district}"
      puts "  decision:".colorize(:light_blue) + " #{self.decision}"
      puts "  decision date:".colorize(:light_blue) + " #{self.decision_date}"
    end

    def self.display_by_district(input)
      self.all.each do |petition|
        if petition.district == input
          petition.display
          puts "----------------------".colorize(:green)
        end
      end
    end

    def self.display_petitioners
      self.all.each do |petition|
        puts "  petitioner:".colorize(:light_blue) + " #{petition.petitioner}"
        puts "----------------------".colorize(:green)
      end
    end

    def self.display_by_petitioner(input)
      self.all.each do |petition|
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
