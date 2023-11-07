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
            filtered_data = data["drinks"][0].reject { |key, value| value.nil? }
            filtered_json = JSON.generate({ "drinks": [filtered_data] })
        

            puts filtered_json
        else
            puts "Error"
        end
    end
end
 
# class cocktailAPI
#     def self.get_random_cocktail
#         url = "www.thecocktaildb.com/api/json/v1/1/random.php"
#         uri = URI.parse(url)
#     end
# end

