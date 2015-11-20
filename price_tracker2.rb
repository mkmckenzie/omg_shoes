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


class Item
#throws a warning that include Capybara::DSL in the global scope is not recommended but not including it doesn't work (undefined method 'visit')
	include Capybara::DSL
	Capybara.default_driver = :poltergeist

	attr_reader :url, :price

	def initialize(url, price)
		@url = url
		@price = price
	end

	/def gotopage
		visit @url
		puts page.body
	end/

	#findPrice should check if the page contains the price or not

	def findPrice
		visit @url
		if page.has_content?(@price) === false
			return "Cannot find that price"
		end

	#these are hardcoded values for the one page I was looking at.
	#the intention here is to scan the page for the price and pick up the id/class of the
	#elements that surround the price, so that they can be referenced later
		
	thisprice = find("span.selected-color-price").text
	thisitem = find("div.product-detail-sku header h1.notranslate
	").text


	end

	#next method should locate what class price is wrapped in and store it as in instance variable
	#some database should store data about each Item 
	#eventually should take info as a form
	#and check every day whether or not that item has gone up or down in price
	#should log price and time every time
	#user should be able to log in and see graphs of items they are tracking
	#should email the user when the price drops
	


 

#File.open("price.txt","w"){|somefile| somefile.puts "#{title} is #{price}"}

#res = RestClient.get(shoeURL)
#File.open("restclientgets.txt","w"){|somefile| somefile.puts res}

end

Item.new("https://factory.jcrew.com/womens-clothing/shoes/Boots/PRDOVR~C9868/C9868.jsp?color_name=olive-moss", 105.00)
