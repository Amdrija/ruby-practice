class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value, parent = nil, left = nil, right = nil)
    @value = value
    @parent = parent
    @left = left
    @right = right
  end
end

class BinaryTree
  def initialize(array)
    build_tree(array)
  end

  def build_tree(array)
    @root = Node.new(array[0])
    array[1..-1].each do |element|
      new_node = Node.new(element)
      addNode(@root, new_node)
    end
  end
  
  def addNode(root, node)
    if node.value < root.value
      if root.left.nil?
        node.parent = root
        root.left = node
      else
        addNode(root.left , node)
      end
    else
      if root.right.nil?
        node.parent = root
        root.right = node
      else
        addNode(root.right, node)
      end
    end
  end

  def print_ldr(node = @root)
    return if node.nil?
    print_ldr(node.left)
    puts node.value
    print_ldr(node.right)
  end

  def bfs(value)
    q = [@root]
    while !q.empty?
      node = q.shift
      return node if node.value == value
      
      q.push(node.left) unless node.left.nil?
      q.push(node.right) unless node.right.nil?
    end
    nil
  end

  def dfs(value)
    stack = [@root]
    while !stack.empty?
      node = stack.pop
      return node if node.value == value

      stack.push(node.left) unless node.left.nil?
      stack.push(node.right) unless node.right.nil?
    end
    nil
  end
end

bt = BinaryTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
bt.print_ldr
puts bt.bfs(23)
puts bt.dfs(70)