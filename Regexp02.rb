p %(a b c)  # => "a b c"
p %W(a b c) # => ["a", "b", "c"]
p %s(a)     # => :a

# 1 ========================
str.sub(pattern, replacement)

str = "田中さん、こんにちは"

str.sub(/さん/, "君")
# => "田中君、こんにちは"

# 2 ========================
str.gsub(pattern, replacement)

str = "咲いた、咲いた、チューリップが咲いた" 

str.gsub(/咲いた/, "咲かない")
# => "咲かない、咲かない、チューリップが咲かない"

# 3 ========================

# [+] =	1回以上
str = "abc,aabbcc,aaabbbccc"
str.gsub(/a+/, "z")
# => "zbc,zbbcc,zbbbccc"

# [?] は0回か1回繰り返す
# 「ac」と「abc」の部分がパターンにマッチするためこの部分が「z」となりました。
str = "ac,abc,abbc"
str.gsub(/ab?c/, "z")
# => "z,z,abbc"

# [.]は改行以外の任意の文字列を表す
str = "abc,adc,aec"
str.gsub(/a.c/, "z")
# => "z,z,z"
"""
「abc」、「adc」、「aec」の全てがパターンにマッチしています。
このように「.」の部分は「b」でも「d」でも「e」でも1文字の文字列を表してくれます。
"""

# 「.+」によってaとcの間に「1文字以上の任意の文字列」が入るパターンを表す
str = "aefefc"
str.gsub(/a.+c/, "z")
# => "z"

# 4 ========================
str.match(pattern)
"""
引数の正規表現をパターンマッチを行う。
マッチしたときはMatchDataオブジェクトを返しマッチしなかったときはnilを返します。
"""

str = "お腹がすいた、りんごが食べたい"
str = str.match(/お腹がすいた、(.+)が食べたい/)
# => #<MatchData "お腹がすいた、りんごが食べたい" 1:"りんご">
str[0]
# => "お腹がすいた、りんごが食べたい"
str[1]
# => "りんご"

# 5 ========================
# いくつかの文字列の中から1文字にマッチさせたいとき[]を使います。
str = "pane" 

str.match(/p[aiAI]ne/)
# => #<MatchData "pane">

str = "pine" 
str.match(/p[aiAI]ne/)
# => #<MatchData "pine">

str = "pAne"
str.match(/p[aiAI]ne/)
# => #<MatchData "pAne">

str = "pune"
str.match(/p[aiAI]ne/)
# => nil

# 6 ========================
# 範囲を用いた文字クラス

str = "apple"
str.match(/[a-z]pple/)
=> #<MatchData "apple">

str = "Apple"
str.match(/[A-Z]pple/)
=> #<MatchData "Apple">

str = "1pple"
=> "1pple"
str.match(/[0-9]pple/)
=> #<MatchData "1pple">

# 7 ========================
# 文字クラスの省略記法

\w 	単語を構成する文字 [a-zA-Z0-9_]
\W 	単語を構成しない文字 [^a-zA-Z0-9_]

\s 	空白文字 [ \t\r\n\f]
\S 	空白でないような文字 [^ \t\r\n\f]

\d 	10進数の数字 [0-9]
\D 	10進数の数字でないような文字 [^0-9]

\h 	16進数の数字 [0-9a-fA-F]
\H 	16進数の数字でないような文字 [^0-9a-fA-F]

"2015/07/27".match(/\d{4}\/\d{2}\/\d{2}/)
=> #<MatchData "2015/07/27">

# 8 ========================
# 文字列の先頭、文末等を表現するための文字列

^ 	行頭
$ 	行末
\A 	文字列の先頭
\z 	文字列の末尾
\Z 	文字列の末尾（末尾が改行文字ならばその手前にマッチ）

"りんごみかん".match(/^りんご/)
# => #<MatchData "りんご">
"みかんりんご".match(/^りんご/)
# => nil

# 9 ========================
# メタ文字列のエスケープ
# \(バックスラッシュ)を使いましょう。

"aaa??bbb".match(/\?+/)
# => #<MatchData "??">