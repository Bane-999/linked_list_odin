class LinkedList
  @head
  @tail
  attr_reader :head, :tail

  def initialize; end

  class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  # def node_name(node)
  #     a = node.inspect.split(" ")
  #     a[0][14..]
  # end

  # adds a new node containing value to the end of the list
  def append(value)
    node = Node.new(value)
    if (@head == nil)
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    node = Node.new(value, @head)
    if (@head == nil)
      new_node = Node.new(value)
      @head = new_node
      @tail = new_node
    else
      @head = node
    end
  end

  def size
    count = 0
    node = @head
    until (node == nil)
      node = node.next_node
      count += 1
    end
    count
  end

  def at(index)
    node = @head
    index.times do
      node = node.next_node
      if (node == nil)
        puts "No Node with this index!"
        return
      end
    end
    node
  end

  # removes the last element from the list
  def pop
    if (@head == nil)
      puts "Linked List is empty!"
      return
    else
      node = @head
      until (node.next_node == tail)
        node = node.next_node
      end
      pop_return = node.next_node
      node.next_node = nil
      @tail = node
      pop_return
    end
  end

  def contains?(value)
    node = @head
    until (node == nil)
      if (value == node.value)
        return true
      else
        node = node.next_node
      end
    end
    return false
  end

  def find(value)
    index = 0
    node = @head
    until (node == nil)
      if (value == node.value)
        return index
      end

      index += 1
      node = node.next_node
    end
    return nil
  end

  def to_s
    node = @head

    if (node == nil)
      puts "Linked List is empty!"
    end

    until (node == nil)
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    print "nil\n"
  end
end
