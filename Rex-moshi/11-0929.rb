# ========== 1 ==========
arr = [["apple"],["banana"],["orange"]].flatten
arr.each do |i|
  puts i
end

# 実行結果
apple
banana
orange

# ========== 2 ==========
exceptions = {
  NameError => "変数または定数が存在しません",
  ArgumentError => "引数が不正です",
  RuntimeError => "特定の例外が発生しました"
}

begin
  raise # 例外クラスの指定を省略した場合はRuntimeErrorが発生
rescue => e
  puts exceptions[e.class]
else
  puts "例外は発生しませんでした"
end

#=> 特定の例外が発生しました

# ======= 例 1 =======
begin
  raise ArgumentError, "引数が不正です"
rescue => e
  puts e.class   # => ArgumentError
  puts e.message # => 引数が不正です
else
  # resuce節が実行されるのでelse節は実行されない
end
#=> ArgumentError
#=> 引数が不正です

# ======= 例 2 =======
begin
  raise "特定の例外が発生しました"
rescue => e
  puts e.class   # => RuntimeError
  puts e.message # => 特定の例外が発生しました
end

# ======= 例 3 =======
begin
  raise
rescue StandardError => e
  puts e.class   # => RuntimeError
  puts e.message # => 空文字
end

#=> RuntimeError
#=> => nil

# ========== 3 ==========
# IOクラスのクラスメソッドを選択してください。

IO.write("readme.md", "Ruby\nExamination\n") 
# => ファイルreadme.mdに第2引数の文字列を書き込みファイルを閉じる

IO.readlines("readme.md") 
# => ["Ruby\n", "Examination\n"]

# ========== 4 ==========
# Fileクラスのクラスメソッドではないものを選択してください。
File.closeメソッド, File.homeメソッド, File.pwdメソッドはFileクラスのクラスメソッドではありません。

# ========== 5 ==========
# member?
hash = {"apple" => "grate", "banana" => "ole", "orange" => "juice"}
p hash.member?("apple")

# <実行結果>
# true

# ========== 6 ==========
# 実行してもエラーにならないコードを選べ
def bar(n)
  puts n
end
bar 5 # => 5

def bar(n)
  puts n
end
bar (10) # => 10

def bar(*n1, n2)
  puts n1
  puts n2
end
bar 5, 6, 7, 8
'''
5
6
7
8
'''
# 可変長引数を2つ定義することはできません。
def bar(*n1, n2, *n3)
  puts n1
  puts n2
end
bar 5, 6, 7, 8 #=> syntax error 

def bar(n1, *n2, n3)
  puts "n1: #{n1}, n2: #{n2}, n3: #{n3}" 
end
bar 5, 6, 7, 8
# n1: 5, n2: [6, 7], n3: 8

# ========== 7 ==========
# 実行後の textfile.txt 内容になるようにXXXXに適切なコードを選べ

open('textfile.txt', XXXX) do |f|
  data = f.read.upcase
  f.rewind
  f.puts data
end

# 実行前の textfile.txt 内容
'''
recode 1
recode 2
recode 3
'''
# 実行後の textfile.txt 内容
'''
RECODE 1
RECODE 2
RECODE 3
'''

# ANSWERS

w
'''
not opened for reading (IOError) が発生します。
wはファイルを書き込みモードで開くため、f.readでエラーになります。
'''

a+
'''
recode 1
recode 2
recode 3
RECODE 1
RECODE 2
RECODE 3
'''
# a+はファイルを読み込みモード + 追記書き込みモードで開きます。
# ファイルの読み込みは、ファイルの先頭から行いますが、
# 書き込みは、ファイルの末尾に行います。
# f.rewindでファイルポインタをファイルの先頭に移動したとしても、
# ファイルの末尾に書き込まれます。

w+
'''
空ファイルになります。
'''
# w+は新規作成・読み込み + 書き込みモードで開きます。
# 既にファイルが存在する場合は、空になります。

r+
'''
RECODE 1
RECODE 2
RECODE 3
'''
# r+は読み込み + 書き込みモードで開きます。

# ========== 8 ==========
a = [1, 2, 3, 4, 5]

a.each { |n| puts n }
#=> [1, 2, 3, 4, 5]

a.each_index { |n| puts n }
#=> [1, 2, 3, 4, 5]

a.each_with_index { |n, i| puts n }
#=> [1, 2, 3, 4, 5]

a.each_with_index { |n, i| puts i }
#=> [1, 2, 3, 4, 5]
