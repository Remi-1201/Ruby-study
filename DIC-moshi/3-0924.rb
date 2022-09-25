# =============== 1 ==============
cooking = "Rice\nBread\rPasta\n\r"

# 非破壊メソッド
p cooking.chomp
# => “Rice\nBread\rPasta\n”

# =============== 2 ==============
music = "Jazz\nRock\rTechno\n\r!"

# 非破壊メソッド
music.chop
p music
# => "Jazz\nRock\rTechno\n\r!"

# =============== 3 ==============
File.openのmodeについて正しい説明をしている選択肢を選べ。

# “a”は書き込み専用。ファイルが存在しない場合、新規作成する。

# =============== 4 ==============
lang = ["python", "ruby", "perl", "c#", "swift"]
result = lang.inject(0) { |i, s| s.size > i ? s.size : i}

puts result # 6

# =============== 5 ==============
Dirクラスのインスタンスメソッドとして存在しているものを選べ。

Dir#seek

# =============== 6 ==============
2 * 0xBF # => 382