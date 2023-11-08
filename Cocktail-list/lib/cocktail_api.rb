require 'net/http'
require 'open-uri'
require 'json'
class CocktailAPI
    def self.get_random_cocktail
        url = URI("https://www.thecocktaildb.com")
        path = "/api/json/v1/1/random.php"



        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true if url.scheme == 'https'

        request = Net::HTTP::Get.new(path)

        response = http.request(request)



        if response.code == '200'
            data = JSON.parse(response.body)
            drink_data = data["drinks"]
        if drink_data
            name = drink_data[0]["strDrink"]
            ingredients = (1..15).map { |i| drink_data[0]["strIngredient#{i}"] }.compact
                
              puts "Your random cocktail is:"
              puts "Name: #{name}"
              puts "Ingredients:"
              ingredients.each { |ingredient| puts ingredient }
            else
              puts "No drink data found in the response."
            end
            
        else
            puts "Error"
        end
    end
end