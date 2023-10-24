require_relative "../config/environment"

class Run
    def initialize
        puts "Hello and welcome to your peronal cocktail list"
   
        def menu
            puts "MENU:"
            puts ".random - to find a random cocktail"
            puts ".list - to view your saved list"
            puts ".exit - to exit the program"
            puts "Please choose from the above options"
        end
    end

   
end

 


Run.new.menu