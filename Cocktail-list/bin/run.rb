require_relative "../config/environment"
require_relative "../lib/cocktail_api"

class Run
  def initialize
    puts "Hello and welcome to your personal cocktail list"
  end

  def menu
    puts "MENU"
    puts "Please choose from the below options:"
    puts ".random - to find a random cocktail"
    puts ".list - to view your saved list"
    puts ".exit - to exit the program"
  end

  def run
    is_running = true
    while is_running
      menu
      choice = gets.chomp.downcase

      if choice == ".exit"
        is_running = false
        system("clear")
        puts "Now exiting the program"
      elsif choice == ".random"
        system("clear")
        random
      elsif choice == ".list"
        system("clear")
        list
      else
        puts "Invalid input. Please select from the options provided."
      end
    end
  end

    def random
    @is_random = true
    while @is_random
      CocktailAPI.get_random_cocktail
      puts "Would you like to add this cocktail to your list? (Y/N)"
      input = gets.chomp.downcase
      case input
        when "y"
          puts "Your cocktail has been saved."
          puts "Would you like another random cocktail? (Y/N)"
          another_random_cocktail
        when "n"
          puts "Would you like another random cocktail? (Y/N)"
          another_random_cocktail
        else 
        puts "Incorrect value. Please select either Y or N"
        input
        
        end
      end
  end

  def another_random_cocktail
    input = gets.chomp.downcase
    if input == 'y'
    elsif input=='n'
      @is_random = false
    else
      puts "Incorrect value. Please select either Y or N"
      input 
      another_random_cocktail
    end
  end
end
run_program = Run.new
run_program.run