# ========== 1 ==========
h = Hash.new("default value")

h[:a]

p h[:a] # => "default value"

p h   # => {}

h[:b] = 100

p h # => {:b=>100}

# ========== 2 ==========
Hashの初期化は {} または Hash.new で行います。

Hash[] # => {}

Hash.new # => {}

# ========== 3 ==========
File.closeメソッド, 
File.homeメソッド, 
File.pwdメソッドはFileクラスのクラスメソッドではありません。

# ========== 4 ==========
