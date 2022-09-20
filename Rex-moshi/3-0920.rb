# =========== 1 ===========
def hoge(n)
  unless n == 3
    ret = "hello"
  end
  if n == 5
    ret = "world"
  end
  ret
end

str = ''            # => ""
str.concat hoge(4)  # => "hello"
str.concat hoge(5)  # => "helloworld"

puts str # helloworld

# =========== 2 ===========
a = [1, 2, 3, 4, 5]
b = [2, 4, 6]

a - b # => [1, 3, 5]

# nextメソッドはレシーバの次の整数を返します
(a - b).map(&:next) # => [2, 4, 6]

a & b # => [2, 4]

a | b # => [1, 2, 3, 4, 5, 6]

a && b  # => [2, 4, 6]

# =========== 2 ===========
# attr_writer = 書き込み用のメソッドなので、読み取りはできません。
class Foo
  attr_writer :a
end

foo = Foo.new
foo.a = "REx"
puts foo.a
# undefined method `a' for #<Foo:0x000055a484fffa90 @a="REx"> (NoMethodError)

# =========== 3 ===========
(1..10).each_cons(3) {|arr| p arr } 
# [1, 2, 3]
# [2, 3, 4]
# [3, 4, 5]
# [4, 5, 6]
# [5, 6, 7]
# [6, 7, 8]
# [7, 8, 9]
# [8, 9, 10]

(1..10).each_slice(3) {|arr| p arr } 
# [1, 2, 3]
# [4, 5, 6]
# [7, 8, 9]
# [10]

# =========== 4 ===========
"""
foo (2) * 2はメソッド名と引数の間に空白があるため、
foo((2) * 2)が呼ばれたと解釈されます。
よって、4の4乗の256になります。
"""
def foo(n)
  n ** n
end

puts foo (2) * 2 # 256

# =========== 5 ===========
arr = [1,2].zip([3,4])
# => [[1, 3], [2, 4]]

arr = [1,2].product([3,4])
# => [[1, 3], [1, 4], [2, 3], [2, 4]]

[[1, 3], [1, 4], [2, 3], [2, 4]].transpose
# => [[1, 1, 2, 2], [3, 4, 3, 4]]

# =========== 6 ===========
str = "aaabbcccddd"
p str.scan("c")
# => ["c", "c", "c"]

"Ruby Examination".scan("xa")                    
# => ["xa"]
"Ruby Examination".scan("xa") { |s| p s.upcase } 
# => "XA"
"Ruby Examination".scan(/../)                    
# => ["Ru", "by", " E", "xa", "mi", "na", "ti", "on"]

# =========== 7 ===========
x = %(a b)
y = %W(c d)
z = y << x

p z # => ["c", "d", "a b"]

p %(a b c)  # => "a b c"
p %W(a b c) # => ["a", "b", "c"]
p %s(a)     # => :a

# =========== 8 ===========
v1 = 1 - 1 == 0
v2 = v1 || raise RuntimeError
puts v2 && false
# => syntax error, unexpected constant, expecting `do' or '{' or '(' (SyntaxError)

# RuntimeErrorがあるため、シンタックスエラーになっています。
# この挙動を回避するには、以下の3つの方法があります。

# ex1)
v1 = 1 - 1 == 0
v2 = v1 or raise RuntimeError
puts v2 && false # => false

# ex2)
v1 = 1 - 1 == 0
v2 = v1 || raise(RuntimeError)
puts v2 && false # => false

# ex3)
v1 = 1 - 1 == 0
v2 = v1 || (raise RuntimeError)
puts v2 && false # => false

# =========== 9 ===========
arr = [
  true.equal?(true),
  nil.eql?(NilClass),
  String.new.equal?(String.new),
  1.equal?(1)
]
# => [true, false, false, true]

p arr.collect { |a| a ? 1 : 2 }.inject(:+)
# => 6

# =========== 10 ===========
Date#to_s = Date.today.strftime("%Y-%m-%d")
