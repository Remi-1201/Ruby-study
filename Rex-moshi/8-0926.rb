# ========== 1 ==========
Thread.new, Thread.start, Thread.forkはスレッドオブジェクトを生成します。

Thread.new {}   # => #<Thread:0x00007fc5e0836000@(irb):1 run>
Thread.start {} # => #<Thread:0x00007ffaa68110e8@(irb):2 run>
Thread.fork {}  # => #<Thread:0x00007f917003cb28@(irb):3 run>

# ========== 2 ==========
Stringにto_aメソッドはありません。

hoge = "a".to_a
puts hoge.class #エラーになる

# ========== 3 ==========
#d == 3..d == 5 => 一時的に真偽を保持する

10.times{|d| print d == 3..d == 5 ? "T" : "F" }

# FFF TTT FFFF 

# ========== 4 ==========
# Array(3)はArray([3])と宣言したことと同じ意味になります。この時ブロックの内容は無視されます。
arr = Array(3){"a"}
arr.first.upcase
p arr #(NoMethodError)

arr = Array(3){"a"}
arr.first.upcase!
p arr #(NoMethodError)

arr = Array.new(3){"a"}
arr.first.upcase
p arr #=> ["a", "a", "a"]

arr = Array.new(3){"a"}
arr.first.upcase!
p arr #=> ["A", "a", "a"]

# ========== 5 ==========
s = <<'EOF'
Hello,
Ruby
'EOF'
EOF

p s #=> "Hello,\nRuby\n'EOF'\n"

# ========== 6 ==========
Stringクラスにto_hというメソッドはありません。

hoge = "a".to_h
puts hoge.class # (NoMethodError)

# ========== 7 ==========
実行後の textfile.txt 内容になるようにXXXXに適切なコードを選べ。

File.open('testfile.txt', XXXX) do |f|
  f.write("recode 1\n")
  f.seek(0, IO::SEEK_SET)
  f.write("recode 2\n")
end

# 'a', 'a+'

# ========== 8 ==========
(10..15).to_a.map.with_index(1) do |elem, i|
  puts i
end

"""
1
2
3
4
5
6
"""

# ========== 9 ==========
hash = { a: 100, b: 200, c: 300, a: 150, c: 250 }
p hash

"""
(irb):28: warning: key :a is duplicated and overwritten on line 28
(irb):28: warning: key :c is duplicated and overwritten on line 28 

=> {:a=>150, :b=>200, :c=>250}
"""
