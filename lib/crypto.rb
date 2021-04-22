require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
   
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
page.class

def crypto_name
crypto_name_array = page.xpath('//td[@class = "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]/div').map {|node| node.text}
end

def crypto_price
crypto_price_array = page.xpath('//div[@class = "price___3rj7O "]/a[@class = "cmc-link"]').map {|node| node.text.gsub(/[^\d\.]/, '').to_f}
end

def get_hash(array_keys, array_values)
result = Hash.new
result = array_keys.zip(array_values).to_h
end

# 3) Réorganiser ce hash dans un array de plusieurs mini-hash
def hash_to_mini_hash(hash)
hash.flatten.to_a.each_slice(2).to_a
end

def perform(array_keys, array_values)
  array_keys = crypto_name
  array_values = crypto_price
  result = get_hash(array_keys, array_values)
  puts hash_to_mini_hash(result)
end

perform(crypto_name_array, crypto_price_array)