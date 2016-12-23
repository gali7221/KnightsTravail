class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup # referenc
  end
end

a = Stack.new
a.add(6)
a.add(4)
a.add(3)
p a.show
a.show << 3
p a.show
