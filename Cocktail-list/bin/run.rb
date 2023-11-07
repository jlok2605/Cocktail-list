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
        puts "This is your list of saved cocktails:"
        # Implement listing saved cocktails logic here
      else
        puts "Invalid input. Please select from the options provided."
      end
    end
  end

  def random
    puts "Your random cocktail is:"
    CocktailAPI.get_random_cocktail
    puts "Would you like to add this cocktail to your list?(Y/N)"
    input = gets.chomp

    if input.downcase =="y"
        puts "You have saved cocktail_name to your list"
    else input.downcase =="n"
        puts "Would you like another random cocktail? (Y/N)"
        input = gets.chomp
        if input.downcase =="y"
            random
        elsif input.downcase =="n"
            puts "Now quitting to menu"

        else puts "Incorrect value please select either Y or N"
        end
    end
    
    end
end

run_program = Run.new
run_program.run