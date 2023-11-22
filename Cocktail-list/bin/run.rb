require_relative "../config/environment"
require_relative "../lib/cocktail_api"

class Run
  def initialize
    puts "Hello and welcome to your personal cocktail list"
    @savedcocktails = []
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
      cocktails = CocktailAPI.get_random_cocktail
      puts "Would you like to add this cocktail to your list? (Y/N)"
      input = gets.chomp.downcase
      case input
        when "y"
          puts "Your cocktail has been saved."
          save_cocktail_to_db(cocktails)
          another_random_cocktail
        when "n"
          another_random_cocktail
        else 
        puts "Incorrect value. Please select either Y or N"
        another_random_cocktail
        end
      end
  end

  def another_random_cocktail
    puts "Would you like another random cocktail? (Y/N)"
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

  def save_cocktail_to_db(cocktails)
    cocktail_data = cocktails[0]
    if cocktail_data.nil?
      puts "No cocktail data found."
      return
    end
    name = cocktail_data["strDrink"]
    ingredients = extract_ingredients(cocktail_data)
    @savedcocktail = SavedCocktail.create(name: name, ingredients: ingredients)
  end
  def list
    puts "Here is your cocktail list:"
    @savedcocktails.each_with_index do |cocktail,i|
      puts "#{i+1}. Name: #{cocktail[:name]}"
      puts "Ingredients:"
      cocktail[:ingredients].each {|ingredient| puts ingredient}
    end
  end

  def extract_ingredients(cocktail)
    (1..15).map { |i| cocktail["strIngredient#{i}"] }.compact
  end
end
run_program = Run.new
run_program.run