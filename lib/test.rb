require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'watir'

test_site = "https://coinmarketcap.com/all/views/all/"

browser = Watir::Browser.new
page = Nokogiri::HTML(URI.open(test_site))   
page.class

browser.goto test_site

browser.button(xpath,'//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[3]/button').click

puts "success"
# <button type="button" class="wn9odt-0 iGNdpc cmc-button cmc-button--color-default">Load More</button>
# //*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[3]/button