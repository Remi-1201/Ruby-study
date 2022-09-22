# =============== 1 ==============
ef.downto(ab){|s| print(s)} #エラーになる

# =============== 2 ==============
score = [["kobayashi", 86],["murata", 54],["azuma", 72]]
score.sort { |a, b| -a[1] <=> -b[1] }
# => [["kobayashi", 86], ["azuma", 72], ["murata", 54]]

score.sort { |a, b| a[1] <=> b[1] }
# => [["murata", 54], ["azuma", 72], ["kobayashi", 86]]

score.sort { |a, b| a[0] <=> b[0] }
# => [["azuma", 72], ["kobayashi", 86], ["murata", 54]]

score.sort { |a, b| a[1] <=> b[1] }.reverse_each
# => #<Enumerator: ...>

# =============== 3 ==============
singer=["shintani", "kamiya"]
p singer.shift
# => "shintani"

# =============== 4 ==============
readline = ファイルを一行読み込み、成功した場合はその文字列を返す。

# =============== 5 ==============
# Fileクラスのメソッドとして存在しないものを選べ。

File.chdir

# =============== 6 ==============
true & a = "We" # => true
false | b = "are" # => true
2 == 1 && c = "Ruby" # => false
5 > 3 || d = "Engineer" # => true

p = a + b + c + d
# no implicit conversion of nil into String (TypeError)


# =============== 6 ==============
IO#getsと IO#readlineの説明として正しいものを選べ。

どちらも、行の区切りを文字列で指定できる。

# =============== 7 ==============
（１）に入るモードを選択肢の中から選べ
# => “w”

File.open( "study.rb", （１） ) { |file| 
  file.puts("Hello, World!") }
end

# =============== 8 ==============
enu = [1, 5, 8, 13, 17, 21, 28, 36].find { |n| n % 7 == 0 }
print enu # 21=> nil

# =============== 9 ==============
a = ['3p', '913', 'Zx', 'ssr', 'M7', 'W']

a.grep(/[A-Z0-9]/)
# => ["3p", "913", "Zx", "M7", "W"]

a.grep(/[A-Z]/)
# => ["Zx", "M7", "W"]

a.grep(/[0-9]/)
=> ["3p", "913", "M7"]

# =============== 10 ==============
s = ["h", "e", "l", "l", "o"].join("").chars.to_a
print s
# => [“h”, “e”, “l”, “l”, “o”]

s = ["h", "e", "l", "l", "o"].join("")
print s
# => hello

s = ["h", "e", "l", "l", "o"].join("").chars
print s
# => [“h”, “e”, “l”, “l”, “o”]

# =============== 11 ==============
2 * 0xBF # => 382

# =============== 12 ==============
color = "red\nblue\ngreen\nblack\nwhite\n"

s = color.each_line.map{|i| i.chomp}.join(' ')
print s
# red blue green black white

s = color.each_line.map{|i| i.chomp} 
print s
# ["red", "blue", "green", "black", "white"]