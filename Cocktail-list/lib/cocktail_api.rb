require 'net/http'
require 'open-uri'
require 'json'


url = URI("https://www.thecocktaildb.com")
path = "/api/json/v1/1/random.php"



http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

request = Net::HTTP::Get.new(path)

response = http.request(request)

if response.code =='200'
    data = JSON.parse(response.body)
    puts JSON.pretty_generate(data)
else
    puts "Error"
end

# class cocktailAPI
#     def self.get_random_cocktail
#         url = "www.thecocktaildb.com/api/json/v1/1/random.php"
#         uri = URI.parse(url)
#     end
# end

