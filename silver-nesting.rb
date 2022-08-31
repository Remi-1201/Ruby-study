#-case01----------------------------------------------
class C
  CONST = "Good, night"
end

module M
  CONST = "Good, evening"
end

module M
  class C
    CONST = "Hello, world"
  end
end

module M
  class C
    p CONST   #=>"Hello, world"
  end
end

#-case01_refactoring----------------------------------------------
class C
  CONST = "Good, night"
end

module M
  CONST = "Good, evening"
  class C
    CONST = "Hello, world"
    p CONST               #=>"Hello, world"
    p Module.nesting      #=>[M::C, M]
  end
end

#-case02----------------------------------------------
class C
  @val = 3
  attr_accessor :val
  class << self
    @val = 10
  end

  def initialize
    @val *= 2 if val
  end
end

c = C.new
c.val += 10

p c.val
# => nesting/case02.rb:14:in `<main>': undefined method `+' for nil:NilClass (NoMethodError)

#-case02_refactoring----------------------------------------------
class C
  @val = 3
  attr_accessor :val
  class << self
    @val = 10
  end

  def initialize
    @val *= 2 if val
  end
end

c = C.new
c.val += 10

p c.val
# => nesting/case02.rb:14:in `<main>': undefined method `+' for nil:NilClass (NoMethodError)

#-case03----------------------------------------------
module M
  def foo
    super
    puts "M#foo"
  end
end

class C2
  def foo
    puts "C2#foo"
  end
end

class C < C2
  def foo
    super
    puts "C#foo"
  end
  prepend M
end

c = C.new
c.foo

"""
C2#foo
C#foo
M#foo
"""

#-case04----------------------------------------------
module M1
  class C1
    CONST = "001"
  end

  class C2 < C1
    CONST = "010"

    module M2
      CONST = "011"

      class Ca
        CONST = "100"
      end

      class Cb < Ca
        p CONST  #=>"011"
      end
    end
  end
end

#-case05----------------------------------------------
class Object
  CONST = "100"
end

class C
  CONST = "010"
  class << self
    CONST = "001"
    def sample
      CONST
    end
  end
end

p C::CONST   # "010"
p C::sample  # "001"
