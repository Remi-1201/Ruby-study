(10..15).to_a.map.with_index(1) do |elem, i|
  puts i
end

'''1
1
2
3
4
5
6
'''

p "-2-----------------"
p (10..15).to_a

#[10, 11, 12, 13, 14, 15]

p "-3-----------------"
(10..15).to_a.map do |elem|
  p elem
end

'''3
10
11
12
13
14
15
'''

p "-4-----------------"
(10..15).to_a.map.with_index do |elem, i|
  p [elem, i]
end

'''4
[10, 0]
[11, 1]
[12, 2]
[13, 3]
[14, 4]
[15, 5]
'''

p "-5-----------------"
(10..15).to_a.map.with_index(1) do |elem, i|
  p [elem, i]
end

'''5
[10, 1]
[11, 2]
[12, 3]
[13, 4]
[14, 5]
[15, 6]
'''

p "------------------"
(10..15).to_a.map.each_with_index do |elem, i|
  p [elem, i]
end

'''
[10, 0]
[11, 1]
[12, 2]
[13, 3]
[14, 4]
[15, 5]
'''

# https://docs.ruby-lang.org/ja/2.1.0/class/Enumerator=3a=3aLazy.html
# class Enumerator::Lazy
# - map や select などのメソッドの遅延評価版を提供するためのクラス。
# - 動作は通常の Enumerator と同じですが、
#   一部のメソッドが遅延評価を行う（＝配列ではなく Enumerator を返す）ように再定義されています。

p (1..100).each.lazy.chunk(&:even?).first(5)
# => [[false, [1]], [true, [2]], [false, [3]], [true, [4]], [false, [5]]]

p (1..100).each.lazy.chunk(&:even?).force.take(5)
# => [[false, [1]], [true, [2]], [false, [3]], [true, [4]], [false, [5]]]

# -------------------
p (1..100).each.lazy.chunk(&:even?).force
# => [[false, [1]], [true, [2]], [false, [3]], [true, [4]], ..., [false, [99]], [true, [100]]]

p (1..100).each.lazy.chunk(&:even?).to_a
# => [[false, [1]], [true, [2]], [false, [3]], [true, [4]], ..., [false, [99]], [true, [100]]]

p (1..100).each.lazy.chunk(&:even?).entries
# => [[false, [1]], [true, [2]], [false, [3]], [true, [4]], ..., [false, [99]], [true, [100]]]
