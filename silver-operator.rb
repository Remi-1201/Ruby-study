# 多重代入
# https://docs.ruby-lang.org/ja/2.1.0/doc/spec=2foperator.html#multiassign

a, b = 0
p [a, b] # [0, nil]

c, a = 1
p [c, a] # [1, nil]

a, d = 1, 2
p [a, d] # [1, 2]

b, c = 3
p [b, c] # [3, nil]

print "result:"
p [a, b, c, d] # result:[1, 3, nil, 2]
