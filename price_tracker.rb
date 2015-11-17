require 'rubygems'
#require 'nokogiri'
require 'open-uri'
#require 'openssl'
#require 'rest-client'
require 'capybara'
require 'capybara/poltergeist'

#manually set phantomjs executable file or else it throws an error that phantomjs doesn't work with my system
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :phantomjs => "C:/phantomjs-1.9.7-windows/phantomjs.exe")
end

#throws a warning that include Capybara::DSL in the global scope is not recommended but not including it doesn't work (undefined method 'visit')
include Capybara::DSL
Capybara.default_driver = :poltergeist

shoeURL = "https://factory.jcrew.com/womens-clothing/shoes/Boots/PRDOVR~C9868/C9868.jsp?color_name=olive-moss"

visit shoeURL

price = find("span.selected-color-price").text
item = find("div.product-detail-sku header h1.notranslate").text
#doc = Nokogiri::HTML(open(shoeURL, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

#price = doc.css("span.selected-color-price")
#i can pull things but anything with the price returns an empty string :(


#puts "#{title} is #{price}" 

File.open("price.txt","w"){|somefile| somefile.puts "#{title} is #{price}"}

#res = RestClient.get(shoeURL)
#File.open("restclientgets.txt","w"){|somefile| somefile.puts res}