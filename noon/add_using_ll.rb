class Node

  attr_accessor :data, :next_node

  def initialize(data, next_node=nil)
    @data = data
    @next_node = next_node
  end

end

class LinkedList

  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def add(data)
    new_node = Node.new(data)
    if !@head
      @head = new_node
    else
      current_node = @head

      while current_node.next_node
        current_node = current_node.next_node
      end

      current_node.next_node = new_node
    end
  end

  def remove
    @head = @head.next_node
  end

end

def calculate_add_node_get_balance(val, result_ll)
  if val > 9 
    new_node_val = val%10
    balance = val/10
  else
    new_node_val = val
    balance = 0
  end
  result_ll << new_node_val

  balance
end


def sum(num1, num2)
  num1_len = num1.length
  num2_len = num2.length
  longer_num_arr = num1_len > num2_len ? num1 : num2
  shorter_num_arr = num1_len > num2_len ? num2 : num1

  longer_ll = LinkedList.new
  shorter_ll = LinkedList.new
  result_ll = []

  longer_num_arr.each do |val|
    longer_ll.add(val)
  end

  shorter_num_arr.each do |val|
    shorter_ll.add(val)
  end

  current_longer_ll_node = longer_ll.head
  current_shorter_ll_node = shorter_ll.head
  balance = 0

  while current_longer_ll_node.next_node && current_shorter_ll_node.next_node
    sum_of_digits = (current_longer_ll_node.data+current_shorter_ll_node.data+balance)

    balance = calculate_add_node_get_balance(sum_of_digits, result_ll)

    current_longer_ll_node = current_longer_ll_node.next_node
    current_shorter_ll_node = current_shorter_ll_node.next_node
  end

  sum_of_digits = (current_longer_ll_node.data+current_shorter_ll_node.data+balance)
  balance = calculate_add_node_get_balance(sum_of_digits, result_ll)

  
  while current_longer_ll_node.next_node
    sum_of_digits = (current_longer_ll_node.next_node.data+balance)
    balance = calculate_add_node_get_balance(sum_of_digits, result_ll)
    current_longer_ll_node = current_longer_ll_node.next_node
  end

  # sum_of_digits = (current_longer_ll_node.data+balance)
  # balance = calculate_add_node_get_balance(sum_of_digits, result_ll)
  # end

  if balance > 0
    result_ll << balance
  end

  result_ll

end

p sum([9,9,9,9,9,9,9], [9,9,9,9])

# l1 = LinkedList.new
# l2 = LinkedList.new

# l1.add(2)
# l1.add(4)
# l1.add(3)

# l2.add(5)
# l2.add(6)
# l2.add(4)




