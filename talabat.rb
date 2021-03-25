class Node
	attr_accessor :data, :next_node

	def initialize(data, next_node=nil)
		@data = data
		@next_node = next_node
	end
end

class LinkedList

	def initialize(data)
		@head = Node.new(data)
	end

	def insert(data, node=@head)
		if node.next_node.nil?
			new_node = Node.new(data)
			node.next_node = new_node
		else
			node = insert(data, node.next_node)
		end

	end

	def traverse(node = @head)
		p node.data
		if(node.next_node)
			traverse(node.next_node)
		end
	end

	def reverse(node=@head)
		if node.next_node.next_node.nil?
			return node.next_node
		else
			prev = node
			reverse(prev)
			node.next_node.next_node = prev
			
		end
		
	end


end


ll = LinkedList.new(5)
ll.insert(6)
ll.insert(8)
ll.insert(90)


ll.reverse
ll.traverse
