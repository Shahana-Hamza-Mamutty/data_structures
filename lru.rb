class Node

  attr_accessor :data, :prev_node, :next_node

  def initialize(data = nil)
    @data = data
    @prev_node = nil
    @next_node = nil
  end

end

class LRU

  attr_accessor :head, :tail, :data_to_node_hash, :capacity

  def initialize(data, capacity)
    @data_to_node_hash = {}
    @capacity = capacity
    @head = nil
    @tail = nil
    put(data)
  end

  def put(data)

    if @data_to_node_hash[data]
      remove(data_to_node_hash[data])
    else
      if @data_to_node_hash.length >= @capacity
        remove(@head)
      end
    end

    add(data)

    traverse
  end

  def add(data)

    new_node = Node.new(data)

    if !@head
      @head = new_node
    else
      if !@tail
        @tail = new_node
        @tail.prev_node = @head
        @head.next_node = @tail
      else
        @tail.next_node = new_node
        new_node.prev_node = @tail
        @tail = new_node
      end
    end

    @data_to_node_hash[data] = new_node

  end

  def remove(node)
    prev_node = node.prev_node
    next_node = node.next_node

    if prev_node
      prev_node.next_node = next_node
      @tail = prev_node if !next_node
    else
      @head = next_node
    end

    if next_node
      next_node.prev_node = prev_node 
    end

    @data_to_node_hash.delete(node.data)
  end

  def traverse_reverse
    current_node = @tail
    while current_node.prev_node != nil
      p current_node.data
      current_node = current_node.prev_node
    end

    p current_node.data
  end

  def traverse
    current_node = @head

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


lru = LRU.new(1, 4)
lru.put(2)
lru.put(1)
lru.put(2)
lru.put(3)
lru.put(4)
lru.put(5)
lru.put(2)
lru.put(2)
lru.put(6)
lru.put(7)
# p "====="
# lru.traverse
# lru.add(4)
# lru.add(5)
# lru.add(6)

# lru.traverse_reverse
# p lru.tail.data