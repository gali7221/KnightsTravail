class PolyTreeNode
  # attr_accessor :parent
  attr_reader :children, :value, :parent

  def initialize(value) # default value
    @value = value
    @parent, @children = nil, []
  end

  # what does the parent setter method?
  # sets a parent for self!
  def parent=(par)
    if self.parent # if it has a parent. essentially deletes its parent
      # Goes into parents children and remove self from the child list.
      self.parent.children.delete(self)
    end
    #
    @parent = par # sets a new parent
    par.children << self unless par.nil?# becomes child of new parent
  end

  def add_child(child_node)
    # self is parent
    # setting new child to current parent
    child_node.parent = self
  end

  def remove_child(child_node)
    # what is a way of removing a child
    raise "node is not a child" unless children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return nil if self.nil?
    return self if self.value == target_value

    children.each do |child|
      result = child.dfs(target_value)
      # child if child.value == target_value
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self] # this is initial queue with your root value

    until queue.empty?
      # shift the first element of the queue
      el = queue.shift

      return el if el.value == target_value
      el.children.each do |child|
        queue << child
      end
    end
    nil
  end

end

# n1 = PolyTreeNode.new
# n2 = PolyTreeNode.new
#
# n2.parent(n1)
