require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "./config/cocktail.db"
)

require_relative "../lib/saved_cocktails"