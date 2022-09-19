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

# ===============================
"%d"が10進数表現で数値を出力します

p "Hello%d" % 5   # = "Hello5"

===============================
EOSと"EOS"はヒアドキュメント内で式展開を行います。
識別子をシングルクォートで'EOS'囲う場合は***式展開は行われず***、
全て文字列として扱われます。

str = <<EOS
よりニッチに。よりユニークに。
  IT市場はもちろん、ヘルスケア・医療・介護など
    次世代市場における企業や生活者のユーザビリティを向上させる
      サービス、ソフトウェアを開発しています。
    #{1 + 1}
EOS
puts str

"""
よりニッチに。よりユニークに。
  IT市場はもちろん、ヘルスケア・医療・介護など
    次世代市場における企業や生活者のユーザビリティを向上させる
      サービス、ソフトウェアを開発しています。
    2
"""

# ===============================
# 問題の0.upto(5).select(&:odd?)は、
# レシーバの各要素の奇数のものを返します。

p 0.upto(5).select(&:odd?) #= [1, 3, 5]

# 例1
[0, 1, 2 ,3, 4, 5].select { |n| n if n.odd? }     # => [1, 3, 5]
[0, 1, 2 ,3, 4, 5].select { |n| n if n % 2 == 1 } # => [1, 3, 5]
[0, 1, 2 ,3, 4, 5].select { |n| n unless n.even? } # => [1, 3, 5]
[0, 1, 2 ,3, 4, 5].select { |n| n unless n % 2 == 0 } # => [1, 3, 5]

# ===============================
# Stringにbinaryメソッドはありません。
p "7".binary # = undefined method `binary' for "7":String (NoMethodError)

# 7.to_s(3): selfを3進数に変換した、21が表示されます。
p 7.to_s(3) # = 21

# 0xFF: 0xは16進数を表すプレフィックスです。
# ここでは16進数を10進数に変換された、255が表示されます。
p 0xFF # = 255

p "80" # = 80

# ===============================
# Enumerable#any?はブロックの戻り値がtrueになると繰り返しをその時点で止めます。
# 繰り返しが止まるのは3回目の繰り返し、つまり$valが3になった時点です。

$val = 0

class Count
  def self.up
    $val = $val + 1
    $val == 3 ? true : false
  end
end

[*1..10].any? do
  Count.up
end

p $val # = 3

# ===============================
# 実行してもエラーにならないコードを選べ
"""
以下のコードは**irb**や**pry**ではSyntaxErrorとなりますが、
ファイルにコードを記述しスクリプトを実行する場合はSyntaxErrorにはなりません。
"""
1: (1..10).each
2: .reverse_each
3: .each do |i|
4:   puts i
5: end

"""
以下のコードは1, 2行目の行末でバックスラッシュ()を記述することで、
1行のコードとみなされます。
"""
(1..10).each \
.reverse_each \
.each do |i|
  puts i
end

"""
10
9
8
7
6
5
4
3
2
1
"""

# ===============================
def hoge
  x = 0
  (1...5).each do |i|
    x += 1
  end
  x
end
puts hoge

# = 4が表示される (1 + 1 + 1 + 1)

# ===============================
# Enumerable #selectはブロックの戻り値がtrueになる要素を配列にして返します。(any?はブロックの戻り値がtrueになると繰り返しをその時点で止めます)
# 配列の長さは10ですので、ブロックの戻り値がtrueかを問わず10が表示されます。

$val = 0

class Count
  def self.up
    $val = $val + 1
    $val == 3 ? true : false
  end
end

[*1..10].select do
  Count.up
end

p $val # = 10

# ===============================
# 次の表が、問題文と選択肢のメソッドの一覧と意味です。

"""
find_all, select = 各要素に対してブロックを評価した結果が、真である要素の配列を作成し返します
detect = 要素に対してブロックを評価した結果が、最初に真になった要素を返します
collect, map = 各要素に対してブロックを評価した結果を配列に格納し返します
"""
# ===============================
"""
subは第一引数の検索対象のパターンと、
第二引数の置換後の文字列を使って---１回だけ---レシーバーの文字列を置換します。
"""
p "Hi, I love Ruby.".sub(/[A-Z]/, "*") # = "*i, I love Ruby."

# ===============================
chars = "I love apple, banana and grape"

5.times do
  chars = chars.sub("a", "@")
end

p chars # = "I love @pple, b@n@n@ @nd grape"

# ===============================
(x, y), z = 1, 2, 3

p z # = 2

# 変数yにはnilが代入され、3は無視される
x # => 1
y # => nil
z # => 2

(x, y), z = [1, 2], 3 # 変数yには2が代入る

x # => 1
y # => 2
z # => 3

# ===============================
# 実行結果がRExと表示されるプログラムを選択してください。
CONST = "REx"

def foo
  CONST
end

puts foo # => "REx"

# ===============================
p [["apple"],["banana"],["orange"]].flatten
# => ["apple", "banana", "orange"]

p ["apple", "banana", "orange"].reverse
# => ["orange", "banana", "apple"]

p %|apple banana orange|
# => "apple banana orange"

p ["apple", "banana", "orange"].flatten!
# => nil

p [["apple"],["banana"],["orange"]].flatten!
# => ["apple", "banana", "orange"]

# ===============================
arr = (1..30).to_a
container = []

arr.each_slice(7) do |i|
  container << i
end

p container.length # = 5

p container
"""
[[1, 2, 3, 4, 5, 6, 7],
[8, 9, 10, 11, 12, 13, 14],
[15, 16, 17, 18, 19, 20, 21],
[22, 23, 24, 25, 26, 27, 28],
[29, 30]]
"""

# ===============================
# clear =	ハッシュの中身を空にします。破壊的メソッドです。

h = {a: 100, b: 200}
h.clear
p h # = {}と表示される

# ===============================
arr = [5, 3, 8, 1, 4, 2, 6, 9, 0, 7]

p arr.sort!{ |a, b | b <=> a }
# => [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

p arr.sort!{ |a, b | b <=> a }.reverse! 
# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

p [5, 3, 8, 1, 4, 2, 6, 9, 0, 7].sort!{ |a, b | a <=> b } 
#=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

p [5, 3, 8, 1, 4, 2, 6, 9, 0, 7].sort!{ |a, b | b <=> a } 
#=> [9, 8, 7, 6, 5, 4, 3, 2, 1, 0] 

# ===============================
"""
Numeric#step(limit, step)はselfからstepずつ加算し、limitまでをブロックに渡します。
1.step(5,1)は「1から1ずつ加算し、5までの数値」という意味になります。
"""
def hoge
  x = 0
  1.step(5,1) do |i|
    x += 1
  end
  puts x
end

hoge # = 5が表示される

# ===============================
Dirクラスのクラスメソッド = Dir.pwd
Dir.pwd # => "/Users/user/RubyExamination"

# ===============================
Fileクラスのクラスメソッドを選択してください = File.chmod, File.delete

File.chmod(0644, "text.txt")
# => text.txtファイルのモードを「所有者は読み書き可能で実行不可能」「所有グループとその他は読み込みのみ可能で書き込みと実行は不可能」に変更

# 削除成功
File.delete("text_1.txt", "text2.txt") # => 2

# 削除失敗
File.delete("text_1.txt") # => Errno::ENOENT: No such file or directory @ unlink_internal - text_1.txt

# ===============================
# 3番目から4文字のcdefが出力されます
str = "abcdefghijk"
p str[2,4]

# => "cdef"

# ===============================
raise ['Error Message']
# = exception class/object expected (TypeError)

"""
StandardErrorを継承しないクラスのインスタンスをraiseメソッドの引数に指定すると、TypeErrorが発生し次のメッセージが表示されます。

exception class/object expected

この問題ではraiseメソッドに配列を指定しているので、TypeErrorが発生し同様のメッセージが表示されます。
"""

# ===============================
# @@が付く変数はクラス変数です。
# クラス変数は、そのクラス変数が定義されているクラスの全インスタンスで共有されます
#  foo1, foo2で@@fooは共有され実行結果は3/3となります。

class Foo

  @@foo = 0

  def foo
    @@foo
  end

  def foo=(value) 
    @@foo = value
  end
end

foo1 = Foo.new
foo1.foo += 1   # => 1
foo2 = Foo.new
foo2.foo += 2   # => 3

puts "#{foo1.foo}/#{foo2.foo}"   # => 3/3

# ===============================
# productはレシーバーの配列と引数の配列から---それぞれ1つ要素---を取り出し新しい配列を作成し、全ての配列を要素とする配列を返します。

p [1, 2].product([3, 4])
# => [[1, 3], [1, 4], [2, 3], [2, 4]]

p [[1, 2],[3, 4]].transpose
# => [[1, 3], [2, 4]]

p [[1, 2],[3, 4],[5, 6]].transpose
# => [[1, 3, 5], [2, 4, 6]]

# ===============================
# Hashクラスについて適切な記述を選びなさい（複数選択）

# member?
hash = {"apple" => "grate", "banana" => "ole", "orange" => "juice"}
p hash.member?("apple")
# <実行結果>
# true

# to_a
hash = {"apple" => "grate", "banana" => "ole", "orange" => "juice"}
p hash.to_a
# <実行結果>
# [["apple", "grate"], ["banana", "ole"], ["orange", "juice"]]

# update
hash = {"apple" => "grate", "banana" => "ole", "orange" => "juice"}
hash.update({"grape" => "juice"})
p hash
# <実行結果>
# {"apple"=>"grate", "banana"=>"ole", "orange"=>"juice", "grape"=>"juice"}

# clear
hash = {"apple" => "grate", "banana" => "ole", "orange" => "juice"}
p hash.clear
# <実行結果>
# {}

# ===============================
# メソッドと変数の探索順位は変数が先です。
hoge = 0
def hoge
  x = 0
  5.times do |i|
    x += 1
  end
  x
end
puts hoge # = 0

def h
  x = 0
  5.times do |i|
    x += 1
  end
  x
end
puts h # = 5

# ===============================
class Foo
  attr_reader :a

  def initialize
    @a = "REx"
  end
end

foo = Foo.new
puts foo.a      # => "REx"

# ===============================
p [1, 2, 3].inject{|x, y| x + y ** 2} rescue p $!
# => 14 (1+4=5. 5+9=14)

p [1, 2, 3].inject(0){|x, y| x + y ** 2} rescue p $!
# => 14 (0+1=1, 1+4=5. 5+9=14)

p [1, 2, 3].inject([]){|x, y| x << y ** 2} rescue p $!
# => [1, 4, 9]

p [1, 2, 3].inject do|x, y| x + y ** 2 end rescue p $!
# => #<LocalJumpError: no block given>

# ===============================
"""
String#to_iメソッドは文字列を整数に変換します。
整数と見なせない文字がある場合はその文字までが変換対象になります。
"""

arr = [
  "a".to_i(36),
  "070".to_i(0),
  nil.to_i,
  "0b0001".to_i
]

p arr # => [10, 56, 0, 0]

# 引数nに基数を指定することでn進数へ変換します。
p "a".to_i(36) #=> 10

# nに0を指定した場合, 変換対象の接頭辞から基数を判断します。
p "070".to_i(0) #=> 56

# 空文字、nilが変換対象の場合は0を返します。
p nil.to_i #=> 0

p "0b0001".to_i #=> 0

# ===============================
# 認識できる接頭辞は下記の通りです。

# 2進数
"0b10".to_i(0) # => 2

# 8進数
"010".to_i(0)  # => 8
"0o10".to_i(0) # => 8

# 10進数
"0d10".to_i(0) # => 10

# 16進数
"0x10".to_i(0) # => 16

# ===============================
"""
&& 演算子は

    左辺が true の場合、右辺は実行します。
    左辺が false の場合は、右辺は実行しません。

"""
a1 = [1,2,3]
a2 = [4,2,3]

p a1 && a2
#=> [4, 2, 3]

"""
|| 演算子は

    左辺が true の場合、右辺は実行しません。
    左辺が false の場合は、右辺は実行します。
    
"""