
#define subtotal and cart
subtotal = 0
cart = []
#prompt for sale price
puts "What is the sale price?"
price = gets.chomp

#while price isn't "done", add price to subtotal and cart
# and re-prompt for sale price
while price != "done"
  price = gets.chomp.to_f
  price = '%.2f' % price
  subtotal += price
  cart << price
  puts "What is the sale price?"
end

#if price == "done",output item list
puts "Here are your item prices:"
puts
puts cart

#output total due
puts "The total amount due is $#{subtotal}"

#prompt amount tendered, calculate change...did cust pay enough?
while true
  puts "What is the amount tendered?"
  amount_tendered = gets.chomp.to_f
  change = (amount_tendered - amount_due).abs
  #make change have two forced decimal places
  change = '%.2f' % change
  #if amount_tendered < amount_due, output warning and amount due
  if amount_tendered < amount_due
    puts "WARNING: Customer still owes $#{change}"
  end
end

#else output thanks, change & time
puts
puts "===Thank You!==="
puts "The total change due is $#{change}"
puts
#output time in the format 02/12/2013 5:50PM
puts Time.now.strftime("%m/%d/%Y %l:%M%p")
puts "================"
end




