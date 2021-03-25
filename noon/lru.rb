class Node
	attr_accessor :prev_node, :next_node, :data

  def initialize(data)
    @data = data
    @next_node = nil
    @right_node = nil
  end
end


class DoublyLinkedList
  attr_accessor :head, :tail, :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def add(data)
    node = Node.new(data)

    if !@head
      @head = node
    else
      current_node = @head

      while current_node.next_node
        current_node = current_node.next_node
      end

      current_node.next_node = node
      node.prev_node = current_node
    end

    @length += 1

    node
  end

  def remove(data)
    current_node = @head

    while current_node.next_node

      if current_node.data == data
        prev_node = current_node.prev_node
        next_node = current_node.next_node

        if prev_node && next_node
          prev_node.next_node = next_node
          next_node.prev_node = prev_node
        elsif !prev_node
          @head = next_node
        elsif !next_node
          prev_node.next_node = nil
        end

        break
      else
        current_node = current_node.next_node
      end

    end

    @length -= 1
  end

  def remove_node(node)
    # p "==========node"
    # p node
    prev_node = node.prev_node
    next_node = node.next_node

    # if !next_node
    if prev_node
      prev_node.next_node = next_node 
    else
      @head = next_node
    end

    if next_node
      next_node.prev_node = prev_node 
    end
    @length -= 1
  end

end

class LRU

  attr_accessor :node_hash, :lru

  def initialize(capacity)
    @node_hash = {}
    @capacity = capacity
    @lru = DoublyLinkedList.new
  end


  def add(data)
    # p "=======@node_hash[data]@node_hash[data]@node_hash[data]"
    # p data
    # p @node_hash[data]
    if !@node_hash[data].nil?
      
      # p "====="
      # p @node_hash[data]
      @lru.remove_node(@node_hash[data]
        )
      @node_hash.delete(@node_hash[data])
      @node_hash[data] = @lru.add(data)
    else

      if @lru.length >= @capacity
        @lru.remove_node(@lru.head)
        @node_hash.delete(@lru.head.data)
      end
      @node_hash[data] = @lru.add(data)
    end
  end

  def traverse
    current_node = @lru.head

    p "================================================================"
    # p @head

    # p current_node

    while current_node.next_node != nil
      p current_node.data
      current_node = current_node.next_node
    end

    p current_node.data


    p "=======xenddddddddddddddd"
  end


end


lru = LRU.new( 4)
lru.add(1)
lru.add(1)
lru.add(2)
lru.add(1)
lru.add(3)
lru.add(4)
lru.add(1)
lru.add(5)
lru.add(4)

lru.traverse




















