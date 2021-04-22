require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def get_deputes_urls
  # names_array = Array.new
  # names_array = page.xpath('//*[@id="deputes-list"]/div[1]/ul[1]/li[1]/a').map {|node| node.text}
  page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))   
  page.class

  url_array = Array.new
  href_array = Array.new
  href_array = page.xpath('//ul[@class="col3"]/li/a[@href]').map {|node| node["href"]}
  str = "https://www2.assemblee-nationale.fr"
  puts url_array = href_array.map {|href| href = str+href }
  
end

page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))   
page.class

get_deputes_urls