# ========== 1 ============
ary = [1,2,3,1,2,3,1,2,3]

ary.delete_if {|x| x == 2} # 破壊的メソッド
# => [1, 3, 1, 3, 1, 3]

ary.reject {|x| x == 2} # 破壊的メソッド
# => [1, 3, 1, 3, 1, 3]

p ary
# => [1, 3, 1, 3, 1, 3]

# ========== 2 ============
arr = [
  "a".to_i(36),
  "070".to_i(0),
  nil.to_i,
  "0b0001".to_i
]

p arr # => [10, 56, 0, 0]

# ========== 3 ============
str = "Liberty Fish   \r\n"

str.strip! #(\t\r\n\f\v)を取り除きます

p str # => "Liberty Fish"

# chomp = 末尾から改行コードを取り除きます。
p str.chomp
# => "Liberty Fish"

# chop =  	末尾の文字を取り除きます。
# ただし、文字列の末尾が"\r\n"であれば、2文字とも取り除きます。
p str.chop
# => "Liberty Fis"

# ========== 4 ============
"""
&:<メソッド名>とするとSymbol#to_procが実行されます。
これは---ブロックを指定して奇数を判定する---ことと同じことになります。
"""

p [1,2,3,4,5].partition(&:odd?)
# => [[1, 3, 5], [2, 4]]

p [1,2,3,4,5].partition { |value| value.odd? }
# => [[1, 3, 5], [2, 4]]

p [1,2,3,4,5].partition(!&:even?)
# => syntax error, unexpected & (SyntaxError) --> !&

p [1,2,3,4,5].partition(!:even?)
# => wrong number of arguments (given 1, expected 0) 

p [1,2,3,4,5].partition(:odd?)
# => wrong number of arguments (given 1, expected 0) 

# ========== 5 ============
# IOクラスのクラスメソッドを選択してください。
"""
IO.writeメソッドは第1引数に--指定したファイル--を開き、
第2引数に指定した--文字列の書き込み--を行った後ファイル閉じます。
第3引数で書き込み--開始位置--を指定できます。
"""
IO.write("readme.md", "Ruby\nExamination\n") 
# => ファイルreadme.mdに第2引数の文字列を書き込みファイルを閉じる

"""[readme.mdの内容]
Ruby
Examination
"""

#  IO.readlinesメソッドは引数に指定した--ファイルの内容を全て読み込み--
# 各行を要素に持つ--配列--を返します。
IO.readlines("readme.md") # => ["Ruby\n", "Examination\n"]

# ========== 6 ============
# splat演算子(*)でハッシュを展開することが出来ます。
hash = {a: 100, b: 200}

def splat_hash(a, b)
  p a
  p b
end

splat_hash(*hash)
# => [:a, 100]
#    [:b, 200]

# ========== 7 ============
p '10'.oct # => 8

p 080 # => Invalid octal digit (SyntaxError)

p "110".to_i(2)  # => 6

# ========== 8 ============
hoge = "a".to_a
puts hoge.class

# => undefined method `to_a' for "a":String (NoMethodError)
# => Stringにto_aメソッドはありません。

# ========== 9 ============
a = [1, 2, 3, 5, 8]
b = [1, 3, 6, 7, 8]

c = false || true ? true && false ? a | b : a & b : b ;

p c
# => [1, 3, 8] 

# (a & b = 共通する要素を出力)
p a & b 
# => [1, 3, 8] 

# (重複している要素をまとめて出力)
p a | b # => [1, 2, 3, 5, 8, 6, 7] 

# ( a と b がどちらかが真のとき、最初に評価された a を出力)
p a || b
# => [1, 2, 3, 5, 8] 

# ( a と b がどちらも真のとき、最後に評価された b を出力)
p a && b 
# => [1, 3, 6, 7, 8] 

# ========== 10 ============
# member?
hash = {"apple" => "grate", "banana" => "ole", "orange" => "juice"}
p hash.member?("apple")
# => true

# to_a
hash = {"apple" => "grate", "banana" => "ole", "orange" => "juice"}
p hash.to_a
# => [["apple", "grate"], ["banana", "ole"], ["orange", "juice"]]

# update
hash = {"apple" => "grate", "banana" => "ole", "orange" => "juice"}
hash.update({"grape" => "juice"})
p hash
# => {"apple"=>"grate", "banana"=>"ole", "orange"=>"juice", "grape"=>"juice"}

# clear
hash = {"apple" => "grate", "banana" => "ole", "orange" => "juice"}
p hash.clear
# => {}

# ========== 11 ============
X = 10
X = X < 10 ? "C" : "D"
puts X

"""
(irb):71: warning: already initialized constant X
(irb):70: warning: previous definition of X was here
D
"""

# ========== 12 ============
"""
グローバル変数は$から始まります。
クラス変数は@@から始まります。
インスタンス変数は@から始まります。
定数は大文字アルファベットから始まります。
"""

# ========== 13 ============
a1 = [1,2,3]
a2 = [4,2,3]

p a1 & a2
# => [2, 3]

# ========== 14 ============
s = "1234567890"

# 引数の先頭の文字が ^ の場合は指定した文字以外の文字を削除します。
p s.delete("^1-5") # => "12345"

# - は両端に文字がある場合は--削除の範囲指定--となります。
p s.delete("1-5") # => "67890"

# ,区切りで引数を複数指定した場合は、全ての引数にマッチした文字が削除対象となります。
p s.delete("^1-5", "1-5") # => "1234567890"

# ========== 5 ============
str = "-1234567890-"

p str.delete("2-41-") # => "567890"

p str.delete!("^2-41-") # => "-1234-"

# ^ in the middle of two characters is meaningless if there aren't any ^ in the string
p str.delete!("0^5-9-") # => "1234"

p str.delete("05-9", "^1-4-") # => "1234"

# ========== 6 ============

p [[1, "data 1"], [2, "data 2"]].to_h

# => {1=>"data 1", 2=>"data 2"}

# ========== 7 ============
arr = ["c", 2, "a", 3, 1, "b"]
arr.sort
p arr
# => comparison of Integer with String failed (ArgumentError)

# ========== 8 ============
"""
Rubyではメソッド内で定数を定義することができません。
複数回メソッドを呼び出した場合に、定数が不定となるため定義できません。
宣言された場合は、SyntaxErrorが発生します。
"""
def hoge
  x = 10
  Y = x < 10 ? "C" : "D"
  puts Y
end
hoge
# => dynamic constant assignment (SyntaxError) 


