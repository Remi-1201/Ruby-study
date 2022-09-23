# ================ 1 ================
# メソッドと変数の探索順位は変数が先です。

hoge = 0
def hoge
  x = 0
  5.times do |i|
    x += 1
  end
  x
end
puts hoge # => 0

# ================ 2 ================

(x, y), z = 1, 2, 3

p z # => 2

p (x, y)

p x # => 1

p y # => nil

# 変数yには2が代入る
(x, y), z = [1, 2], 3 

x # => 1
y # => 2
z # => 3

# zにはnilが格納される
x, y, z = 1, 2 
x # => 1
y # => 2
z # => nil

# ================ 3 ================
# File.closeメソッド, File.homeメソッド, 
# File.pwdメソッドはFileクラスのクラスメソッドではありません。

# File.dirnameは引数に指定した文字列の一番後ろの/より前の文字列を返します。
# /を含まない文字列の場合"."を返します。
File.dirname("text.txt") # => "."
File.dirname("REx/text.txt") # => "REx"
File.dirname("Desktop/REx/text.txt") # => "Desktop/REx"

# ================ 4 ================
s = <<-EOF
    Hello,
    Ruby
    EOF

p s # => "    Hello,\n    Ruby\n"

# ================ 5 ================
# 入れ替えの結果キーが重複した場合は、後に定義された方が優先されます。

p ({a: 100, b: 100}).invert # => {100=>:b}

# ================ 6 ================
a = [-1, 2, 3, 4, 5]
b = (4..6).to_a

a.inject(:+) + b.inject(:+) 
# => 13 + 15 = 28

(a | b)                 # => [-1, 2, 3, 4, 5, 6]
(a | b).inject(:-)      # => -21
(a | b).inject(:-).abs  # => *21
(a & b)                 # => [4, 5]
(a & b).inject(:+)      # => 9
(a & b).inject(:+).abs  # => *9
(a | b).inject(:-).abs + (a & b).inject(:+).abs 
# => 21 + 9 = 30

(a | b).inject(:*)                # => -720
b.inject(0) { |x, y| x + y ** 3 } # => 450
(a | b).inject(:*) + b.inject(0) { |x, y| x + y ** 3 } 
# => -720 + 450 = -315

(a || b)                          # => [-1, 2, 3, 4, 5]
(a || b).map(&:succ)              # => [0, 3, 4, 5, 6]
(a || b).map(&:succ).inject(:*)   # => *0
(a && b)                          # => [4, 5, 6]
(a && b).inject(:*)               # => 120
(a && b).inject(:*).abs2          # => *14400
((a || b).map(&:succ).inject(:*) * (a && b).inject(:*).abs2 + 29) 
# => 0 * 14400 + 29 = 29
