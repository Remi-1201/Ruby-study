s = "foo"
begin
  s[4] = ?b
rescue => e
  puts e.class
end

p ?b.class

'''
IndexError
String
'''

p ?b   # "b"
