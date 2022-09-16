#-1---------------------------

def hoge(n)
  if n % 3 == 0
    "hello"
  elsif n % 5 == 0
    "world"
  end
end

str = ''
str.concat hoge(3)
str.concat hoge(5)

puts str # helloworld

#-2---------------------------

p "Hello%d" % 5 # "Hello5"

#-3---------------------------

begin
  "a".to_h
rescue Exception => e
  puts e.class
end

# NoMethodError

#-4---------------------------

str = "a,b,c,d"

p str.split(/,/, 0)
# ["a", "b", "c", "d"]

p str.split(/,/, 1)
# ["a,b,c,d"]

p str.split(/,/, 2)
# ["a", "b,c,d"]

p "a".upto('f').to_a
# ["a", "b", "c", "d", "e", "f"]
