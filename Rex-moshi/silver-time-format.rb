require 'date'

d = Date.new(2015, 1, 5)

puts d.strftime("%x") # 01/05/15
puts d.strftime("%m/%d/%Y") # 01/05/2015
puts d.strftime("%m/%D/%y") # 01/01/05/15/15
puts d.strftime("%M/%d/%y") # 00/05/15
