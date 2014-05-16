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
  menu = []
  CSV.foreach('products.csv', headers: true) do |row|
    #reassigning variables
    row["wholesale_price"] = row["wholesale_price"].to_f
    row["retail_price"] = row["retail_price"].to_f
    menu << row
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
  count
end

def ask_how_many
  puts "How many?"
  gets.chomp
end

#increase item_quantity and item_costs to related coffee name
def add_old_item
end

#add new coffee name, item_quantity, and item_costs
def add_new_item
end

#outputs a list of items purchased: cost/#/type
def show_order
end



#=============================================

#take out information from products.csv
#extract_info returns menu hash w/ sky key for name/wholesale/price
#show_menu takes menu and prints out welcome and menu options
cust_order = {}
menu = extract_csv_info
binding.pry
#options max menu options
options = show_menu(menu)


while true
  #prompt a selection
  puts "Make a selection:"
  selection = gets.chomp.to_i

  #if the selection is invalid, output sorry message
  if selection > options or selection == 0
    puts "
    Sorry, that option isn't available.
    "
  else
    #while the transaction is still going
    while selection != options
      #prompt how many of selection
      how_many = ask_how_many
      #if how_many isn't a valid number, re-ask how many
      while how_many != how_many.to_i.to_s
        puts "
        Sorry, that option isn't available.
        "
        how_many = ask_how_many
      end

      # cust_order[name]= [ cost, how_many]
      # cust_order[light] =>[30, 6]

      #if item's been ordered before, increase the item_quantity and item_costs
      add_old_item
      #else add item key to amount/subtotal values to cust_order
      add_new_item
      #calculate subtotal

      #output subtotal
      puts "subtotal"
    end
  end
end


show_order(some_variable_of_some_kind)

#output complete sale!
#show_order outputs a list of items purchased: cost/#/type
show_order
puts "===Thank You!==="
puts "The total change due is $#{change}
"
#output time in the format 02/12/2013 5:50PM
puts Time.now.strftime("%m/%d/%Y %l:%M%p")
puts "================"



