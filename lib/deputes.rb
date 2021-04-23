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
  return url_array = href_array.map {|href| href = str+href }
end

def get_deputes_first_name(depute_url)
  page = Nokogiri::HTML(URI.open(depute_url))   
  page.class
  depute_first_name = page.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text.split(' ')
  return depute_first_name[1..-2]
end

def get_deputes_last_name(depute_url)
  page = Nokogiri::HTML(URI.open(depute_url))   
  page.class
  return depute_last_name = page.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text.split(' ').last
end

def get_deputes_email(depute_url)
  page = Nokogiri::HTML(URI.open(depute_url))   
  page.class
  return depute_email = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text
end

def perform(url_array)
  deputes_list = Array.new
  url_array = get_deputes_urls

  i = 0
  while url_array[i] != nil do
    depute_url = url_array[i]
    deputes_list << Hash["first_name":get_deputes_first_name(depute_url),"last_name":get_deputes_last_name(depute_url),"email":get_deputes_email(depute_url)]
    i +=1

    puts "performed for #{i} deputés !"
    puts deputes_list
  end

end

# page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"))   
# page.class
url_array = get_deputes_urls
perform(url_array)