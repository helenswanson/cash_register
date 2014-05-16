#prompt amount due
puts "What is the amount due?"
amount_due = gets.chomp.to_f
#prompt amount tendered
puts "What is the amount tendered?"
amount_tendered = gets.chomp.to_f
#calculate change = absolute value of the difference between amount due and amount tendered
change = (amount_tendered - amount_due).abs
#make change have two forced decimal places
change = '%.2f' % change
#if amount_tendered < amount_due, give warning with amount still owed
if amount_tendered < amount_due
  puts "WARNING: Customer still owes $#{change} Exiting..."
#else output thanks, total change returned, and time of transaction
else
  puts
  puts "===Thank You!==="
  puts "The total change due is $#{change}"
  puts
  #output time in the format 02/12/2013 5:50PM
  puts Time.now.strftime("%m/%d/%Y %l:%M%p")
  puts "================"
end
