#prompt for and get sale_price
def gets_amount(amount_type)
  puts "What is the #{amount_type}?"
  gets.chomp
end

#force entered values to have 2 decimal places
def force_2decimals(value)
  '%.2f' % value
end

#========================

subtotal = 0
cart_items = []

#prompt for and get sale price
price = gets_amount("sale price")

#while customer still has items, add price to subtotal and cart array,
# output subtotal, and ask for sale price of new item
while price != "done"
  price = force_2decimals(price)
  subtotal += price.to_f
  cart_items << price
  puts "Subtotal: $#{force_2decimals(subtotal)}"
  price = gets_amount("sale price")
end

#initialize checkout by displaying items and amount due
final_total = force_2decimals(subtotal).to_f
puts
puts "Here are your item prices:"
cart_items.each do |cart_item|
  puts "$#{cart_item}"
end
puts "The total amount due is $#{force_2decimals(final_total)}"
puts

amount_tendered = gets_amount("amount tendered").to_f
change = amount_tendered - final_total

#while money owed, display warning and ask for amount again
while amount_tendered < final_total
    change = force_2decimals(change).to_f.abs
    puts "WARNING: Customer still owes $#{force_2decimals(change)}"
    amount_tendered = gets_amount("amount tendered").to_f
    change = amount_tendered - final_total
end

change = force_2decimals(change.abs)
#else output thanks, change & time
puts
puts "===Thank You!==="
puts "The total change due is $#{change}"
puts
#output time in the format 02/12/2013 5:50PM
puts Time.now.strftime("%m/%d/%Y %l:%M%p")
puts "================"

