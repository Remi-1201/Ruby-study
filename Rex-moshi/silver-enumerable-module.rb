# 配列オブジェクト.inject {|初期値, 要素| ブロック処理 }

p [1, 2, 3].inject{|x, y| x + y ** 2} rescue p $!
# = 14

p [1, 2, 3].inject(0){|x, y| x + y ** 2} rescue p $!
# = 1 + 5 + 9 = 14

p [1, 2, 3].inject([]){|x, y| x << y ** 2} rescue p $!
# = [1, 4, 9]

p [1, 2, 3].inject do|x, y| x + y ** 2 end rescue p $!
# = #<LocalJumpError: no block given>

p '---1行目---------------------'
begin
  [1, 2, 3].inject {|x, y|
    print sprintf("%d + %d ** 2 = ", x, y)
    p x + y ** 2
  }
rescue
  p $!
end

# = 1 + 2 ** 2 = 5
# = 5 + 3 ** 2 = 14

p '---2行目---------------------'
begin
  [1, 2, 3].inject(0) {|x, y|
    print sprintf("%d + %d ** 2 = ", x, y)
    p x + y ** 2
  }
rescue
  p $!
end

# = 0 + 1 ** 2 = 1
# = 1 + 2 ** 2 = 5
# = 5 + 3 ** 2 = 14

p '---3行目---------------------'
begin
  [1, 2, 3].inject([]) {|x, y|
    print sprintf("%s << %d ** 2 = ", x.to_s, y)
    p x << y ** 2
  }
rescue
  p $!
end

# = [] << 1 ** 2 = [1]
# = [1] << 2 ** 2 = [1, 4]
# = [1, 4] << 3 ** 2 = [1, 4, 9]
