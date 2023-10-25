require_relative "../config/environment"

class Run
    def initialize
        puts "Hello and welcome to your peronal cocktail list"
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
        while is_running do 
            menu
            choice = gets.chomp.downcase

            if choice.downcase == ".exit"
                is_running = false
                puts "Now exiting the program"
            end
    end
end
    

   
end

 


run_program = Run.new

run_program.run