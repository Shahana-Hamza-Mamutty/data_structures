class Node

  attr_accessor :data, :next_node

  def initialize(val, next_node=nil)
    @data = val
    @next_node = next_node
  end

end 

class LinkedList

  attr_accessor :head

  def initialize
    @head = nil
  end

  def add_at_front(data)
    node = Node.new(data)

    if @head.nil?
      @head = node 
    else
      node.next_node = @head
      @head = node
    end
  end

  def delete
    @head = @head.next_node
  end

  def add_at_rear(data)
    node = Node.new(data)

    if @head.nil?
      @head = node 
    else
      current = @head

      while current.next_node
        current = current.next_node
      end

      current.next_node = node
    end
  end

  def display_items
    current = @head

    while !current.next_node.nil?
      p current.data
      current = current.next_node
    end

    p current.data
  end

end

def sum_of_linked_lists(l1, l2)
  current1 = l1.head
  current2 = l2.head
  # carry = 0
  result = LinkedList.new
  sum = current1.data + current2.data
  
  if sum.to_s.length > 1
    data_to_add = sum.to_s[1].to_i
    carry = sum.to_s[0].to_i
  else
    data_to_add = sum
    carry = 0
  end

  result.add_at_front(data_to_add)

  while(!current1.next_node.nil? && !current2.next_node.nil?)

    current1 = current1.next_node
    current2 = current2.next_node
    sum = current1.data + current2.data + carry
    if sum.to_s.length > 1
      data_to_add = sum.to_s[1].to_i
      carry = sum.to_s[0].to_i
    else
      data_to_add = sum
      carry = 0
    end
    result.add_at_rear(data_to_add)
  end
  result.display_items
end


l1 = LinkedList.new
l1.add_at_rear(2)
l1.add_at_rear(4)
l1.add_at_rear(3)

l2 = LinkedList.new
l2.add_at_rear(5)
l2.add_at_rear(6)
l2.add_at_rear(4)

sum_of_linked_lists(l1, l2)


# l1.display_items
# p "==="
# l2.display_items

