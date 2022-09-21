# ================= 1 =====================
# IOクラスのクラスメソッドを選択してください。

IO.write("readme.md", "Ruby\nExamination\n") 
# => ファイルreadme.mdに第2引数の文字列を書き込みファイルを閉じる

"""[readme.mdの内容]
Ruby
Examination
"""

IO.readlines("readme.md") # => ["Ruby\n", "Examination\n"]

# ================= 2 =====================
"""
Hash#invertはキーと値を入れ替えます。
入れ替えの結果***キーが重複した場合***は、後に定義された方が優先されます。
"""
p ({a: 100, b: 100}).invert

# {100=>:b}

# ================= 3 =====================
# KeyErrorとStopIterationを捕捉するプログラム

#---------------------------
begin
  # `KeyError`と`StopIteration`が発生する処理
rescue KeyError

rescue StopIteration

end

#---------------------------
begin
  # `KeyError`と`StopIteration`が発生する処理
rescue KeyError, StopIteration

end

#---------------------------
begin
  # `KeyError`と`StopIteration`が発生する処理
rescue *[KeyError, StopIteration]

end

# ================= 4 =====================
def hoge(step = 1)
  current = 0
  Proc.new {
    current += step
  }
end

p1 = hoge
p2 = hoge(2)

p1.call # => 1
p1.call # => 2
p1.call # => 3
p2.call # => 2
p2.call # => 4

p p2.call # => 6

# ================= 5 =====================

def bar(*n1, n2, *n3)
  puts n1
  puts n2
end

bar 5, 6, 7, 8 # => Error

# 可変長引数を2つ定義することはできません。
# 可変長引数の実行結果は次の通りになります。

def bar(n1, *n2, n3)
  puts "n1: #{n1}, n2: #{n2}, n3: #{n3}"
end

bar 5, 6, 7, 8  # => n1: 5, n2: [6, 7], n3: 8

# ================= 6 =====================
IO#eof?: ファイルポインタが終端にある場合、trueを返します。
IO.readlines: ファイルから全てを読み込みます。
IO#seek(offset, whence): ファイルポインタをwhenceからoffsetまで移動します。

IO::SEEK_CUR: 現在のファイルポインタから

io = File.open('list.txt')

while not io.eof?
  # ファイルから全て読み込んだ時点で、ファイルポインタはファイル終端にあります。
  io.readlines 
  # ファイル終端から0文字移動する
  io.seek(0, IO::SEEK_CUR)
  p io.readlines # []のみ表示されます
end

# ================= 7 =====================
h = {a: 100, b: 200}
p h.to_a
# => [[:a, 100], [:b, 200]]

# ================= 8 =====================
Thread.new, Thread.start, Thread.forkはスレッドオブジェクトを生成します。

Thread.new {}   # => #<Thread:0x00007fc5e0836000@(irb):1 run>
Thread.start {} # => #<Thread:0x00007ffaa68110e8@(irb):2 run>
Thread.fork {}  # => #<Thread:0x00007f917003cb28@(irb):3 run>

ブロックが指定されずに呼ばれた場合はThreadErrorが発生します。

Thread.new # => ThreadError

# ================= 9 =====================
a = "Ruby"
b = " on Rails"
a.concat b        #=> "Ruby on Rails"
a.reverse!        #=> "sliaR no ybuR"
p a.index("R", 1) # => 4

# ================= 10 =====================
count = 0

begin
  1 / count
rescue NameError
  count += 1
  retry
rescue NoMethodError
  count += 2
  retry
rescue ZeroDivisionError
  count += 3
  retry   # retryで再度begin節の処理を実行します。
else      # 2度目のbegin節の処理は、1 / 3となり例外は発生せず、else節が実行されます。
  puts 4
ensure    # ensure節は例外発生の有無に関わらず必ず実行される
  puts "count: #{count}"
end

# => 4
# => count: 3

# ================= 11 =====================
File.open('testfile.txt', XXXX) do |f|
  f.write("recode 1\n")
  f.seek(0, IO::SEEK_SET) # IO:SEEK_SETがファイルの先頭からの位置を指定する
  f.write("recode 2\n")
end

# ================= 12 =====================
def foo
  self + 2
end

p 1.foo # => 3

# ================= 13 =====================
foo (2) * 2はメソッド名と引数の間に空白があるため、
foo((2) * 2)が呼ばれたと解釈されます。よって、4の4乗の256になります。

def foo(n)
  n ** n
end

puts foo (2) * 2 # => 256

# ================= 14 =====================
h = {a: 100, b: 200}
p h.invert # => {100=>:a, 200=>:b}

# ================= 15 =====================
p "Hello" % 5 # => "Hello"

p "Hello%d" % 5 # => Hello5
