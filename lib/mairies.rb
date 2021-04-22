require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def get_townhall_urls
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))   
  page.class
  href_array = Array.new
  url_array = Array.new
  href_array = page.xpath('//td[1]/p/a[@href] | //td[2]/p/a[@href] | //td[3]/p/a[@href]').map {|node| node["href"]}
  return url_array = href_array.map {|href| href.gsub("./", "http://annuaire-des-mairies.com/")}
end

def get_townhall_name
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))   
  page.class
  name_array = Array.new
  name_array = page.xpath('//td[1]/p/a[@href] | //td[2]/p/a[@href] | //td[3]/p/a[@href]').map {|node| node.text}
end

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))   
  page.class
  townhall_email = page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').text
end

def get_email_list
  email_list = Array.new
  url_array = get_townhall_urls
  name_array = get_townhall_name

  i = 0
  while url_array[i] != nil do
    email_list << Hash[name_array[i],get_townhall_email(url_array[i])]
    i +=1
  end

  return email_list
end

puts get_email_list