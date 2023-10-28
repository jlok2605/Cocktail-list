require 'net/http'
require 'open-uri'
require 'json'


class cocktailAPI
    def self.get_random_cocktail
        url = "www.thecocktaildb.com/api/json/v1/1/random.php"
        uri = URI.parse(url)
        uri.open
    end
end

