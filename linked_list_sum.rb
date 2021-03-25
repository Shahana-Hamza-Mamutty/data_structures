class Node

  attr_accessor :data, :next_data

  def initialize(data, next_data=nil)
    @data = data
    @next_data = next_data
  end

end

class LinkedList

  attr_accessor :head

  def initialze(val)
    @head = Node.new(val)
  end

  def add_node(val)
    node = Node.new(val)

    last_node = @head

    while last_node.next_data
      last_node = last_node.next_data
    end

    last_node.next_data = node
  end

  def remove_node
    @head = @head.next_data
  end

  def delete_node(val)
    current_node = @head
    prev_node = nil

    while current_node.next_data
      if current_node.val == val
        break
      else
        prev_node = current_node
        current_node = current_node.next_data
      end
    end

    if current_node.next_data && prev_node
      prev_node.next_data = current_node.next_data
    else
      current_node = nil
    end
  end

  def traverse
    current_node = @head
    # p current_node.val
    while current_node.next_data
      p current_node.val
      current_node = current_node.next_data
    end
    p current_node.val
  end

  def reverse
  end

  def insert(pos, val)
  end

  def add_lls(ll1, ll2)
  end


end