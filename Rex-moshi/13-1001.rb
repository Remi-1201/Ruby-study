# ========== 1 ==========
s = <<-EOF
    Hello,
    Ruby
    EOF
p s
# => "    Hello,\n    Ruby\n"

# ========== 2 ==========
#実行後の textfile.txt 内容になるようにXXXXに適切なコードを選べ

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
# ファイルの読み込みは、ファイルの先頭から行いますが、書き込みは、ファイルの末尾に行います。
# f.rewindでファイルポインタをファイルの先頭に移動したとしても、ファイルの末尾に書き込まれます。

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

# ========== 3 ==========
# Rubyではメソッド内で定数を定義することができません。
def hoge
  x = 10
  Y = x < 10 ? "C" : "D"
  # puts Y
end
hoge # => SyntaxError

# ========== 4 ==========
v1 = 1 - 1 == 0
v2 = v1 || raise RuntimeError
puts v2 && false # => syntax error

v1 = 1 - 1 == 0
v2 = v1 or raise RuntimeError
puts v2 && false # => false

v1 = 1 - 1 == 0
v2 = v1 || raise(RuntimeError)
puts v2 && false # => false

v1 = 1 - 1 == 0
v2 = v1 || (raise RuntimeError)
puts v2 && false # => false

# ========== 5 ==========
# キーが同じものがあれば、右側で定義されたもので上書きされます。

hash = { a: 100, b: 200, c: 300, a: 150, c: 250 }
p hash # => {:a=>150, :b=>200, :c=>250} 