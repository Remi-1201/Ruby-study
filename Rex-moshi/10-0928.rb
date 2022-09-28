# ========== 1 ==========
# Fileクラスのクラスメソッドを選択してください。

File.chmod(0644, "text.txt")
# 削除成功
File.delete("text_1.txt", "text2.txt") # => 2

# 削除失敗
File.delete("text_1.txt") # => Errno::ENOENT: No such file or directory @ unlink_internal - text_1.txt

File.pwdメソッドとFile.homeメソッドはFileクラスには存在しません。

# ========== 2 ==========
# 次のコードのXXXXに記述するとエラーが発生するコードはどれですか
'''
String#hexは文字列を16進数で解釈して、整数で返します。
16進数で解釈できない場合は0を返します。
'''
"0x90".hex #=> 144

'''
0b2は2進数ではありません。0b10が正しい定義です。
'''
0b2 #=> numeric literal without digits (SyntaxError)

0b10 #=> 2

'80'.oct #=> 0

# ========== 3 ==========
# update === merge! === 破壊的メソッド
hash = {"apple" => "grate", "banana" => "ole", "orange" => "juice"}
hash.update({"grape" => "juice"})
p hash

# <実行結果>
# {"apple"=>"grate", "banana"=>"ole", "orange"=>"juice", "grape"=>"juice"} 

# ========== 4 ==========
Hash() #=> wrong number of arguments (given 0, expected 1) (ArgumentError)

# ========== 5 ==========
# 次のプログラムを実行して同じ結果が得られるプログラムを選んでください。
klass = Class.new
hash = {klass => 100}
puts hash[klass]

# 1
klass = Class.new
hash = {}
hash.store(klass, 100)
puts hash[klass]

# 2
klass = Class.new
hash = Hash[klass, 100]
puts hash[klass]

# ========== 6 ==========
arr = ["c", 2, "a", 3, 1, "b"]
arr.sort
p arr
# comparison of Integer with String failed (ArgumentError)
# lack of (要素1 <=> 要素2)

# ========== 7 ==========
str = "abcdefgh"
puts str[4..6] # efg

puts str[4...-1] # efg

puts str[-4...7]  # efg

# ========== 8 ==========
# do ... endと{ ... }を比べた場合、{ ... }の方が結合度が強いです。
# do ... endの結合度が弱いため、p([1, 2, 3, 4].map)が評価されます。
p [1,2,3,4].map do |e| e * e end
# #<Enumerator: [1, 2, 3, 4]:map>

# 式の内容を直接使用する際は、{ ... }を使用します。
p [1,2,3,4].map { |e| e * e }
# => [1, 4, 9, 16]

# ========== 9 ==========
'''
strip = 文字列の先頭と末尾の空白文字(\t\r\n\f\v)を取り除きます。
'''
str = "   Liberty Fish   \r\n"
p str.strip
# => "Liberty Fish"

p str.chomp
# => "   Liberty Fish   "

p str.chop
# => "   Liberty Fish   "