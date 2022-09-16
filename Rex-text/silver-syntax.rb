#-1--------------------------------

(1..10).each
    .reverse_each
    .each do |i|
  puts i
end

(1..10).each.
    reverse_each.
    each do |i|
  puts i
end

(1..10).each \
.reverse_each \
.each do |i|
  puts i
end

(1..10).each \
.reverse_each \
.each do |i|
  puts i
end

(1..10).to_a.each.
    reverse_each.
    each do |i|
  puts i
end

p '-----------'
(1..10).reverse_each do |i|
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

#-2--------------------------------

X = 10
X = X < 10 ? "C" : "D"
puts X

# case02.rb:2: warning: already initialized constant X
# case02.rb:1: warning: previous definition of X was here
# D

#-3--------------------------------

p [1,2,3,4].map do |e| e * e end
# => #<Enumerator: [1, 2, 3, 4]:map>

p [1,2,3,4].map {|e| e * e }
# => [1, 4, 9, 16]

#-4--------------------------------

def hoge(&block, *args)
  block.call(*args)
end
# syntax/case04.rb:1: syntax error, unexpected ',', expecting ')'
# def hoge(&block, *args)

hoge(1,2,3,4) do |*args|
  p args.length > 0 ? "hello" : args
end        ^
# syntax/case04.rb:3: syntax error, unexpected keyword_end, expecting end-of-input

#-case04_refactoring-----------------

def hoge(*args, &block)
  block.call(*args)
end

hoge(1,2,3,4) do |*args|
  p args
  # => [1, 2, 3, 4]
  p args.length > 0 ? "hello" : args
  # => "hello"
end





