1/ Dirクラスのクラスメソッド ==============

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

2/ IO =============================================

IO#open：ファイルを開く
IO#close：ファイルを閉じる

IO#read：ファイルの内容を末尾まで読み込む。読み込むバイト数の指定も可能
# 例：read
File.open('sample.txt') do |file|
  puts file.read  
end

IO#gets：ファイルを１行ずつ読み込む
# 例：gets
File.open('sample.txt') do |f|
  while line = f.gets
      puts line
  end
end

# each_lineを使いより自然な記述へ (gets = each_line)
File.open('sample.txt') do |f|
  f.each_line do |line|
      puts line
  end
end

IO#write 文字列を書き込む
File.open('sample.txt') do |f|
  f.write 'Ruby' # ファイルに"Ruby"と書き込む
end

IO#rewind
アクセス位置を先頭に戻す

IO#seek、IO#pos=
任意の位置に移動する

3/ File =============================================

a/ ファイルをロックしたりロックを開放するメソッド

File#flock

b/ ファイルに関する情報の取得

File#atime：最後にアクセスした日時
File#ctime：最後に状態を変更した日時
File#mtime：最後に更新した日時
File#size：ファイルサイズ

c/ ファイルに関する情報の取得

File#rename：ファイル名の変更/移動
File#unlink：ファイルの削除
File#symlink：ファイルのシンボリックリンク作成
File#link：ファイルのハードリンク作成
File#symlink：ファイルのシンボリックリンク作成
***File#chmod：ファイルモードの指定
***File#chown：オーナー・グループの変更

d/ ファイル操作

File#dirname：ファイルのディレクトリパス
File#basename：ファイル名
File#extname：拡張子
File#join：ファイルパスの連結
File#split：dirnameとbasenameの配列
File#expend_path：相対パスから絶対パスを取得する

4/ Dir =============================================

a/ ファイル一覧の取得
Dir#entries：ディレクトリに含まれるファイル一覧の取得

b/ ディレクトリ操作
Dir#mkdir：ディレクトリ作成
Dir#chdir：ディレクトリの移動
Dir#rmdir：ディレクトリの削除
Dir#exist?：ディレクトリの存在検査