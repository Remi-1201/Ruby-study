# ========== 1 ==========
"""
次のプログラムを実行して同じ結果が得られるプログラムを選んでください。
"""
klass = Class.new
hash = {klass => 100}
puts hash #=> {#<Class:0x007f9a3f0a7068>=>100}

# a
klass = Class.new
hash = {}
hash.store(klass, 100)
puts hash[klass] #=> 100
puts hash #=> {#<Class:0x00005629c4652d88>=>100}

# b
klass = Class.new
hash = Hash[klass, 100]
puts hash[klass] #=> 100
puts hash #=>{#<Class:0x00005629c48b3208>=>100}

# ========== 2 ==========
"""
実行結果が30以上になるプログラムを選択してください。
"""

#  memo ==========
1 || nil # => 1 右辺は評価されない
nil || 1 # => 1
1 && nil # => nil
nil && 1 # => nil 右辺は評価されない
# ================

a = [-1, 2, 3, 4, 5]
b = (4..6).to_a

puts (a | b).inject(:-).abs + (a & b).inject(:+).abs 
# 30

p ((a || b).map(&:succ).inject(:*) * (a && b).inject(:*).abs2 + 29)  
# 29

p (a | b).inject(:*) + b.inject(0) { |x, y| x + y ** 3 }
# => -315

p a.inject(:+) + b.inject(:+)
# => 28

# ========== 3 ==========
# <<識別子行から識別子行の直前までを文字列として扱います。

s = <<'EOF'
Hello,
Ruby
EOF
'EOF' # 5行目はただの文字列として解釈されます。

p s # => "Hello,\nRuby\n"

# ========== 4 ==========
Dirクラスのクラスメソッド

Dir#mkdir：ディレクトリ作成
Dir#chdir：ディレクトリの移動
Dir#rmdir：ディレクトリの削除
Dir#exist?：ディレクトリの存在検査
Dir#entries：ディレクトリに含まれるファイル一覧の取得

"""
Dir.delete, Dir.rmdirは空のディレクトリを削除します。
ディレクトリの削除に成功すると0を返します。
引数に削除対象のディレクトリのパスを文字列で指定します。
"""

# 削除成功
Dir.delete("RubyExamination") # => 0
Dir.rmdir("RubyExamination")  # => 0

# 削除失敗(ディレクトリが空ではない場合)
Dir.delete("RubyExamination") 
# => Errno::ENOTEMPTY (Directory not empty @ dir_s_rmdir - RubyExamination)
Dir.rmdir("RubyExamination")  
# => Errno::ENOTEMPTY (Directory not empty @ dir_s_rmdir - RubyExamination)

# ========== 5 ==========
Hash#revertメソッドはありません。
Hash#invertメソッドがあります。invertメソッドはキーと値を入れ替えます。

Hash[]で空のHashオブジェクトを生成できる

# ========== 6 ==========
1: s = ["one", "two", "three"]
2: s.pop
3: s.pop
4: s.unshift
5: s.push "four" #末尾に引数の値を破壊的に追加します
6: p s

# <実行結果>
# 1: ["one", "two", "three"]
# 2: ["one", "two"]
# 3: ["one"]
"""
Array#unshift | selfの先頭へ引数の値を破壊的に追加します(FIFO)。
引数が指定されていない場合は何もしません。
"""
# 4: ["one"]
# 5: ["one", "four"]

# ========== 7 ==========
a = [1, 2, 3, 4, 5]

a.each { |n| puts n }
#=> [1, 2, 3, 4, 5]

a.each_index { |n| puts n }
#=> [1, 2, 3, 4, 5]

a.each_with_index { |n, i| puts n }
#=> [1, 2, 3, 4, 5]

a.each_with_index { |n, i| puts i }
#=> [1, 2, 3, 4, 5] 
