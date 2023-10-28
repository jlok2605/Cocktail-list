require 'net/http'
require 'open-uri'
require 'json'


url = "https://www.thecocktaildb.com/api.php"
uri = URI.parse(url)

response = URI.open(url).read

puts response
# class cocktailAPI
#     def self.get_random_cocktail
#         url = "www.thecocktaildb.com/api/json/v1/1/random.php"
#         uri = URI.parse(url)
#     end
# end

