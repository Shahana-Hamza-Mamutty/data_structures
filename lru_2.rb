class Node

  attr_accessor :data, :prev_node, :next_node

  def initialize(data = nil)
    @data = data
    @prev_node = nil
    @next_node = nil
  end

end

class LRU
  attr_accessor :head, :tail, :data_to_node_hash, :capacity, :result

  def initialize(capacity=5)
    @data_to_node_hash = {}
    @head = nil
    @tail = nil
    @capacity = capacity
    @result = ''
  end

  def put_val(val)
    if @data_to_node_hash[val]
      remove_from_cache(@data_to_node_hash[val])
    elsif @data_to_node_hash.length >= @capacity
      remove_from_cache(@head)
    end
    add(val)
  end

  def add(val)
    new_node = Node.new(val)
    if !@head
      @head = new_node
    elsif !@tail
      new_node.prev_node = @head
      @tail = new_node
      @head.next_node = @tail
    else
      @tail.next_node = new_node
      new_node.prev_node = @tail
      @tail = new_node
    end    
    @data_to_node_hash[val] = new_node
  end

  def remove_from_cache(node_to_remove)
    next_node = node_to_remove.next_node
    prev_node = node_to_remove.prev_node

    if prev_node
      prev_node.next_node = next_node
    else
      @head = next_node
    end

    if next_node
      next_node.prev_node = prev_node
    else
      @tail = prev_node
    end

    @data_to_node_hash.delete(node_to_remove.data)
  end

  def traverse_and_calculate_result
    current_node = @head
    @result += current_node.data
    while current_node.next_node
      @result +="-#{current_node.next_node.data}"
      current_node = current_node.next_node
    end
  end

end


  lru = LRU.new(5)

  lru.put_val("A")
  lru.put_val("B")
  lru.put_val("C")
  lru.put_val("A")


  p "==============================="
  # p lru.head.data
  # p lru.tail.data
  # lru.put_val("A")
  # lru.put_val("C")
  # lru.put_val("A")
  # lru.put_val("B")

  lru.traverse_and_calculate_result
  p lru.result

# def LRUCache(strArr)

#   # code goes here
#   # return strArr

#   lru = LRU.new

#   strArr.each do |ele|
#     lru.put(ele)
#   end

#   lru.traverse_and_calculate_result
#   lru.result
# end

# LRUCache(["A", "B", "A", "C", "A", "B"])