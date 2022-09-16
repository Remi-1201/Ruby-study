print('"0x90".hex : ')
begin
  puts "0x90".hex
rescue => e
  puts e.class
end
# "0x90".hex : 144

print "'90' : "
begin
  puts '90'
rescue => e
  puts e.class
end
# '90' : 90

print "0b2 : "
begin
  puts 0b2
rescue => e
  # うまくエラー捕捉できない...
  puts e.class
end

"""
case01.rb:17: numeric literal without digits
  puts 0b2
         ^
case01.rb:17: syntax error, unexpected end-of-input, expecting keyword_end
  puts 0b2
         ^
"""

print "'80'.oct : "
begin
  puts '80'.oct
rescue => e
  puts e.class
end

# '80'.oct : 0

puts '10'.oct
# => 8

puts "110".to_i(2)
# => 6

puts '139'.oct
# => 11
# 変換できない数字を見つけたら、その桁以降を切り捨てる

puts "21".to_i(2)
# => 0
# 変換できない数字を見つけたら、その桁以降を切り捨てる

puts 08
# => Invalid octal digit
