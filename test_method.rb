#!/usr/bin/env ruby
require 'csv'
require 'pry'

#force value to have 2 decimals; output is string
def force_2decimals(value)
  '%.2f' % value
end

#take out information from products.csv
#creates menu hash w/ sky key for name/wholesale/price
def extract_csv_info
  menu = {}
  CSV.foreach('products.csv', headers: true) do |row|
    #create variables
    sku = row["SKU"]
    name = row["name"]
    wholesale = row["wholesale_price"].to_f
    price = row["retail_price"].to_f
    #
    menu[sku] = {name: name, wholesale_price: wholesale, retail_price: price}
  end
  #menu = {120945: {name: Light, wholesale_prices: 2.5,retail_price: 5]
  #      , 679340: {name: Medium,wholesale_prices: 3.25,retail_prices: 7.50],...}
  menu
end

#output welcome + menu in specified format
def show_menu(menu)
  puts "
  Welcome to James' coffee emporium!
  "
  count = 1
  #enter hash menu --> sku = key and product_info = value
  menu.each do |sku, product_info|
    #create variables for items in hash
    price = force_2decimals(product_info[:retail_price])
    name = product_info[:name]
    puts "#{count}) Add item - $#{price} - #{name}"
    count += 1
  end
  puts "#{count}) Complete Sale
  "
end



#=============================================

#take out information from products.csv
#extract_info returns menu hash w/ sky key for name/wholesale/price
#show_menu takes menu and prints out welcome and menu options
menu = extract_csv_info
show_menu(menu)
