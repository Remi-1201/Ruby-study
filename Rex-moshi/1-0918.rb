# ===============================

# 次のコードを実行するとどうなりますか
a = [1]     # a.length = 1の配列
a[5] = 10   # 5番目へ値を入れると、配列の長さが拡張されます
a.compact!  # compact は自身から nil を取り除いた配列を生成して返します。 
p a         # = [1, 10]

# ===============================
eql?は同値性、equal?は同一性を検証する
"""
# injectメソッドは、レシーバの要素に対して引数で指定した処理を行います。
[1, 2, 3].inject(:+)                 # => 6
[1, 2, 3].inject(0) { |x, y| x + y } # => 6

#collectメソッドは、レシーバの各要素に対して引数で指定した処理を行なった結果を含む配列を返します。
[1, 2, 3].collect(&:to_s)            # => ["1", "2", "3"]
[1, 2, 3].collect { |n| n + 1 }      # => [2, 3, 4]
"""
arr = [
  true.equal?(true),                      # => true
  nil.eql?(NilClass),                     # => false
  String.new.equal?(String.new),          # => false
  1.equal?(1)                             # => true
]

p arr.collect { |a| a ? 1 : 2 }.inject(:+) # = 6

# ===============================
Hash#eachのブロックパラメータはArrayで渡されます。
h = {a: 100}
h.each {|p|
  p p.class # = Array
}

# ===============================
# attr_writer = 書き込み用のメソッドなので、読み取りはできません

class Foo
  attr_writer :a
end

foo = Foo.new
foo.a = "REx"
puts foo.a  # = NoMethodErrorが発生する

# 読み取り用のメソッドが定義されていない
# インスタンス変数を参照しようとするとNoMethodErrorが発生します

# ===============================
# String#index(pattern, pos) 	= 文字列のpos番目からpatternを検索し、最初に見つかった位置を返します
a = "Ruby"
b = " on Rails"
a.concat b  #=> "Ruby on Rails"
a.reverse   #=> "sliaR no ybuR"
p a.index("R", 1) # = 8

===============================
"%d"が10進数表現で数値を出力します

p "Hello%d" % 5   # = "Hello5"