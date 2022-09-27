# ========== 1 ==========
a = [1, 2, 3, 5, 8]
b = [1, 3, 6, 7, 8]
c = false || true ? true && false ? a | b : a & b : b ;
p c #=> [1, 3, 8] (a & b )

# ========== 2 ==========
s = ["one", "two", "three"]
s.shift
s.shift
s.unshift
s.push "four"
p s #=> ["three", "four"]

# ========== 3 ==========
IO.size IO.readlines = IOクラスのクラスメソッド

IO.write("readme.md", "Ruby\nExamination\n") 
# => ファイルreadme.mdに第2引数の文字列を書き込みファイルを閉じる

"""
[readme.mdの内容]

Ruby
Examination

"""

IO.readlines("readme.md") # => ["Ruby\n", "Examination\n"]

# ========== 4 ==========
空のHashオブジェクトを生成するにはHash({}), {}, Hash.newのいずれかを用います。

Hash#mergeは非破壊的メソッドです。

Hash#clearは破壊的メソッドです。

# ========== 5 ==========
File.pwdメソッドとFile.homeメソッドはFileクラスには存在しません。

File.chmod(0644, "text.txt")
# => text.txtファイルのモードを
# => 「所有者は 読み書き可能で 実行不可能」
# => 「所有グループ とその他は 読み込みのみ可能で 書き込みと実行は不可能」に変更

# 削除成功
File.delete("text_1.txt", "text2.txt") # => 2

# 削除失敗
File.delete("text_1.txt") # => Errno::ENOENT: No such file or directory @ unlink_internal - text_1.txt
