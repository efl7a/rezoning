require 'colorize'

class Rezoning::CLI
  def call
    puts "Welcome to our informative CLI for rezoning petitions in Charlotte, NC."
    puts "Here are the Rezoning petitions for 2017"
    Rezoning::Scraper.new.scrape_petitions
    display_petitions
    menu
  end

  def display_petitions
    Rezoning::Petition.all.each do |petition|
      puts "#{petition.number}".colorize(:blue)
      puts "  petitioner:".colorize(:light_blue) + " #{petition.petitioner}"
      puts "  description:".colorize(:light_blue) + " #{petition.description}"
      puts "  district:".colorize(:light_blue) + " #{petition.district}"
      puts "----------------------".colorize(:green)
    end
  end

  def menu
    puts "How would you like to search the Rezoning Petitions:"
    puts "Type 1 for petition number."
    puts "     2 for petitioner."
    puts "     3 for district"
    puts "You may type exit anytime to quit the program."
    input = nil
    while input != "exit"
      input = gets.strip
      case input
      when "1"
        puts "Which petition number would you like more information about?"
        input = gets.strip
        Rezoning::Petition.find_by_number(input).display
        puts "Petition number, district or petitioner? Remember, you can always type exit to leave."
      when "2"
        puts "Which district would you like more information about?"
        input = gets.strip
        Rezoning::Petition.display_by_district(input)
        puts "Petition number, district or petitioner? Remember, you can always type exit to leave."
      when "3"
        Rezoning::Petition.display_petitioners
        puts "Which petitioner would you like more information about?"
        input = gets.strip
        Rezoning::Petition.display_by_petitioner(input)
        puts "Petition number, district or petitioner? Remember, you can always type exit to leave."
      end
    end
  end

  def goodbye
    puts "Thank you for using the Rezoning CLI"
  end

end
