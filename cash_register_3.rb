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
  #menu = [{"SKU": 120945, "name": Light, "wholesale_prices": 2.5, "retail_price": 5}
  #      , {"SKU": 679340, "name": Medium, "wholesale_prices": 3.25, "retail_prices": 7.50},...}
  menu
end

#output welcome + menu in specified format
def show_menu(menu)
  puts "Welcome to James' coffee emporium!\n"
  count = 1
  #enter hash menu --> sku = key and product_info = value
  menu.each do |product|
    #create variables for items in hash
    price = force_2decimals(product["retail_price"])
    name = product["name"]
    puts "#{count}) Add item - $#{price} - #{name}"
    count += 1
  end
  puts "#{count}) Complete Sale
  "
  count
end

def ask_how_many()
  puts "How many?\n"
  gets.chomp
end

def add_to_order(menu, selection, cust_order, how_many)
  result = []

  cust_order.each do|product|


    # #if item sku in menu isn't in customer order, add sku and how_many to order in hash
    # if menu[selection-1]["SKU"] != product["SKU"]
    #   cust_order << {"SKU" => menu[selection-1]["SKU"], "units_sold" => how_many}
    # #else add how_many to units for appropriate sku
    # else
    #   #find appropriate sku and...#######################################

    #   #adds how_many to current number of units
    #   product["units_sold"] += how_many
    # end
  end
  #array of hashes where key = sku, values = units sold
  result
end



#outputs a list of items purchased: cost/#/type
def show_order
end

def calculate_subtotal(menu, selection, how_many)
  #subtotal = cost of selection * how_many
   # menu.each do |product|
   #  price = force_2decimals(product["retail_price"])
   #  name = product["name"]
end



#=============================================

#take out information from products.csv
#extract_info returns menu hash w/ sky key for name/wholesale/price
#show_menu takes menu and prints out welcome and menu options
final_total = 0
line_items = []
cust_order = {}
menu = extract_csv_info
#options max menu options
options = show_menu(menu)


while true
  #prompt a selection
  puts "Make a selection:"
  selection = gets.chomp.to_i
  if selection == options
    break
  end

  #if the selection is invalid, output sorry message
  if selection > options or selection == 0
    puts "Sorry, that option isn't available.\n"
  else
    #while the transaction is still going
    if selection != options
      #prompt how many of selection
      how_many = ask_how_many()
      #if how_many isn't a valid number, re-ask how many
      while how_many != how_many.to_i.to_s
        puts "Sorry, that option isn't available.\n"
        how_many = ask_how_many()
      end
      #store information in array
      line_items << [selection, how_many]

      price = menu[selection-1]["retail_price"]
      subtotal = price * how_many.to_f
      final_total += subtotal
      puts "Subtotal: $#{force_2decimals(final_total)}\n"
    end
  end
end


show_order

line_items.each do |selection, quantity|
  sku = menu[selection-1]["SKU"]
  if cust_order.has_key?(sku)
    cust_order[sku] += quantity
  else
    cust_order[sku] = quantity
  end
end
binding.pry

#output complete sale!
#show_order outputs a list of items purchased: cost/#/type
show_order
puts "===Thank You!==="
puts "The total change due is $#{change}\n"
#output time in the format 02/12/2013 5:50PM
puts Time.now.strftime("%m/%d/%Y %l:%M%p")
puts "================"



