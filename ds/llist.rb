class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

class LinkedList

	attr_accessor :input, :ll

	def initialize
		@head = nil
	end

	def add(ele)
		node = Node.new(ele)
		if @head.nil?
			@head = node
		else
			current = @head
			while !current.next.nil?
				current = current.next
			end
			current.next = node
		end
	end

	def display_items
		current = @head
		p current.val
		while !current.next.nil?
			current = current.next
			p current.val
		end
	end

	def add_at_begin(ele)
		node = Node.new(ele)
		node.next = @head
		@head = node
	end

	def delete_first_node
		@head = @head.next
	end

	def insert_item(prev, ele)
		current = @head
		until current.next.nil?
			if current.val == prev
				break
			else
				current = current.next
			end
		end

		temp = current.next
		current.next = Node.new(ele)
		current.next.next = temp
	end

end

ll = LinkedList.new
ll.add(41)
ll.add(67)
ll.add(2)
ll.add(6)
ll.add(8)
ll.add(1)
ll.add_at_begin(99)
ll.add_at_begin(100)
ll.add_at_begin(12)
# p "------1----"
# ll.display_items
# ll.delete_first_node
# p "------2----"
# ll.display_items
# ll.delete_first_node
# ll.delete_first_node
# p "------3----"
ll.insert_item(144, 111)
ll.display_items

