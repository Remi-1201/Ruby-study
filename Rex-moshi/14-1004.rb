# ========== 1 ==========
a = "Ruby"
b = " on Rails"
a.concat b
a.reverse!
p a.index("R", 1) # => 4

# ========== 2 ==========
# 次のプログラムを実行して同じ結果が得られるプログラムを選んでください。
klass = Class.new
hash = {klass => 100}
puts hash[klass] # 100

klass = Class.new
hash = {}
hash.store(klass, 100)
puts hash[klass] # 100

klass = Class.new
hash = Hash[klass, 100]
puts hash[klass] # 100

# ========== 3 ==========
str = "1;2:3;4"
p str.split(";|:")
# => ["1;2:3;4"]

[1, 2, 3, 4]を得るためには、"1;2:3;4".split(/;|:/)とします。

# ========== 4 ==========
String#stripは破壊的メソッドではないので、内容は変更されません。

str = "Liberty Fish   \r\n"
str.strip
p str
# => "Liberty Fish   \r\n"