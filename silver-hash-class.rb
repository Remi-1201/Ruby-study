h = Hash.new("default value")
h[:a]
h[:b] = 100

p h
# => {:b=>100}

p h[:a]
# => "default value"

p h.keys
# => [:b]

hash = {a: 100, b: 200}
p *hash

'''
[:a, 100]
[:b, 200]
'''

p hash.to_a

# [[:a, 100], [:b, 200]]
