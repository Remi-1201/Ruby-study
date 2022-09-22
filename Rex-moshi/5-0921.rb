# ================ 1 ================
Hash({}) # => {}

[[1, "data 1"], [2, "data 2"]].to_h # => {1=>"data 1", 2=>"data 2"}

# ================ 2 ================
puts "Ruby-Examination"[5] # => E

"Apple"[0] # => A

"Apple"[-1] # => e

# []メソッドの別名のsliceメソッドがあります
puts "Apple".slice(3) # => l

# ================ 3 ================
a = [1, 2, 3, 5, 8]
b = [1, 3, 6, 7, 8]
c = false || true ? true && false ? a | b : a & b : b ;
p c

# => [1, 3, 8]

# ================ 4 ================
# | は集合の和結合を行います。重複する要素は取り除かれます。

a1 = [1,2,3]
a2 = [4,2,3]

p a1 | a2 # => [1, 2, 3, 4]

# ================ 5 ================
str = "abcdefghijk"
p str[2,4]
# => "cdef"

# ================ 6 ================
arr = ["apple", "banana", "orange"].reverse
arr.each do |i|
  puts i
end

# 実行結果
orange
banana
apple

# ================ 7 ================
a = [1]
a[5] = 10

p a.compact
# => [1, 10]

# 番目へ値を入れると、配列の長さが拡張されます。未指定の要素へはnilが入ります。
# Array#compact!ではないので、selfは変わりません。
p a
# => [1, nil, nil, nil, nil, 10]

# ================ 8 ================
# 実行結果がRExと表示されるプログラムを選択してください。

#外部で定義された定数はメソッド内部で呼び出し可能
CONST = "REx"
def foo
  CONST
end
puts foo # => REx

# メソッド内部で定数を定義することはできません
def foo
  CONST = "REx"
end
puts foo # => Error 

def foo
  var = "REx"
end
puts foo # => REx

# 外部で定義されたローカル変数はメソッド内部から呼び出すことはできません
var = "REx"
def foo
  var
end
puts foo # => undefined local variable or method (NameError)

# ================ 9 ================
arr = [
  "a".to_i(36),
  "070".to_i(0),
  nil.to_i,
  "0b0001".to_i
]

p arr # => [10, 56, 0, 0]

# ================ 10 ================
a = [1, 2, 5, 7, 8]
b = [1, 3, 6, 7, 9]
c =  nil || a & b | a && a | b
p c
# => [1, 2, 5, 7, 8, 3, 6, 9]
p c =  nil || a & b
# => [1, 7]
p c =  nil || a & b | a 
# => [1, 7, 2, 5, 8]
p c =  nil || a & b | a && a
# => [1, 2, 5, 7, 8]
p c =  nil || a & b | a && a | b
# => [1, 2, 5, 7, 8, 3, 6, 9]

# ================ 11 ================
Stringにappendメソッドはありません。
文字列を結合するには、String<<を用います。

a = "Ruby"
b = " on Rails"
a.append b
a.reverse
p a.index("R", 1) # エラーが発生する

# ================ 12 ================
Thread.new {}   # => #<Thread:0x00007fc5e0836000@(irb):1 run>
Thread.start {} # => #<Thread:0x00007ffaa68110e8@(irb):2 run>
Thread.fork {}  # => #<Thread:0x00007f917003cb28@(irb):3 run>

Thread.join {} # => error

# ================ 13 ================
"""
Rubyでモジュールを定義するにはmoduleキーワードを使います。
モジュールは次のように書くと定義することが出来ます。
"""

module モジュール名

end

# ================ 14 ================
Array#delete_ifと同じ動作をするのはreject!です。 
