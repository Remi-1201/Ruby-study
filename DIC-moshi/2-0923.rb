# =============== 1 ==============
member = ["kikuchi", "maeda", "tanaka"]
member.each_with_index do |x, y|
print "#{x} #{y+1} "
end
# kikuchi 1 maeda 2 tanaka 3 

# =============== 2 ==============
id = [1, 2, 3, 4, 5]
p id.delete(3) #=> 3

# =============== 3 ==============
インスタンスメソッド「clear」の機能を選べ。
# ハッシュを空にする。

# =============== 4 ==============
getsメソッドと同じ振る舞いをするインスタンスメソッドを選べ。
# readline

# =============== 5 ==============
戻り値が「Object」以外となるコードを選択肢の中から選べ。

puts Integer.superclass # Numeric

puts IO.superclass # Object

puts Method.superclass # Object

puts Dir.superclass # Object

# =============== 6 ==============
puts "A".ord + 1 # 66

# =============== 7 ==============
ope = "wakuwaku" == "waku" * 2 || "Rubyは楽しい"
print ope # true

# =============== 8 ==============
選択肢の中から破壊的メソッドを選べ。

Array#concat

# =============== 9 ==============
p sprintf("%#b", 20) # ”0b10100”
p sprintf("%#o", 20) # ”024”
p sprintf("%#x", 20) # ”0x14”

# =============== 10 ==============
lang = ["python", "ruby", "perl", "c#", "swift"]
result = lang.inject(0) { |i, s| s.size > i ? s.size : i}
puts result # 6

# =============== 11 ==============
"aa".upto("ae") {|s| print s, ',' }
# aa,ab,ac,ad,ae

# =============== 12 ==============
p 0xBF     # => 191
p 2 * 0xBF # => 382