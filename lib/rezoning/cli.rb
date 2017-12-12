class Rezoning::CLI
  def call
    puts "Welcome to our informative CLI for rezoning petitions in Charlotte, NC."
    menu

    goodbye
  end

  def list_years
    puts "2011, 2012.."
    #from http://charlottenc.gov/planning/Rezoning/Pages/Home.aspx

  end

  def menu
    puts "How would you like to explore the Rezoning Petitions-year, district, or road? You may type exit anytime to quit the program."
    input = nil
    while input != "exit"
      input = gets.strip
      case input
      when "year"
        puts "List the available years"
      when "district"
        puts "List the available districts"
      when "road"
        puts "Which road would you like to search for?  Please do not add Rd, Ave, or Blvd."
      end
    end
  end

  def goodbye
    puts "Thank you for using the Rezoning CLI"
  end

end
