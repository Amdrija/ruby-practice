class Node
  attr_accessor :value, :next
  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      @tail.next = new_node
    end
    @tail = new_node
    self
  end

  def to_s
    current = @head
    list_string = ""
    while !current.nil?
      list_string += "(#{current.value}) -> "
      current = current.next
    end
    list_string += "nil"
  end

  def prepend(value)
    new_node = Node.new(value,@head)
    if @head.nil?
      @tail = new_node
    end
    @head = new_node
    self
  end

  def size
    current = @head
    size = 0
    while !current.nil?
      size += 1
      current = current.next
    end
    size
  end

  def at(index)
    current = @head
    while !current.nil? && index > 0
      index -= 1
      current = current.next
    end
    return current.value if index == 0
    nil
  end

  def pop
    return nil if @head.nil?

    popped_value = @tail.value

    if @head == @tail
      @head = @tail = nil
    else
      current = @head
      while current.next != @tail
        current = current.next
      end
      current.next = nil
      @tail = current
    end
    popped_value
  end

  def contains?(value)
    current = @head
    while !current.nil?
      return true if current.value == value
      current = current.next
    end
    false
  end

  def find(value)
    index = 0
    current = @head
    while !current.nil?
      return index if current.value == value
      current = current.next
      index += 1
    end
    nil
  end

  def insert_at(index, value)
    return self.append(value) if @head.nil? || index >= self.size
    return self.prepend(value) if index <= 0
    
    current = @head
    #this will insert after the current node
    #so we iterate 1 less time over the loop
    while index > 1
      current = current.next
      index -= 1
    end

    new_node = Node.new(value , current.next)
    current.next = new_node
    self
  end

  def remove_at(index)
    return nil if index >= self.size || index < 0 || @head.nil?

    return @head = @tail = nil if @head == @tail
      
   if index == 0
    @head = @head.next
    return self
   end

    current = @head
    #this will remove the node after the current node
    #so we iterate 1 less time over the loop
    while index > 1
      current = current.next
      index -= 1
    end
    current.next = current.next.next
    self
  end
end

list = LinkedList.new
list.append(5).append(6).prepend(7).append(8)
puts list
puts list.find(9)
puts list.remove_at(-1)
