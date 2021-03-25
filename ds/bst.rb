class Node

	attr_accessor :val, :left, :right

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end

end

class BST

	def initialize(root_val)
		@root = Node.new(root_val)
	end

	def insert(ele, node = @root)
		# p "----------------"
		# p node
		if ele <= node.val
			if node.left.nil?
				node.left = Node.new(ele)
			else
				insert(ele, node.left)
			end
		else
			if node.right.nil?
				node.right = Node.new(ele)
			else
				insert(ele, node.right)
			end
		end
	end

	def inorder(node = @root)
		# p "----------------"
		# p node
		if node #.present?
			inorder(node.left) if node.left
			puts(node.val)
			inorder(node.right) if node.right
		end
	end

	def preorder(node = @root)
		# p "----------------"
		# p node
		if node.val #.present?
			puts(node.val)
			preorder(node.left) if node.left
			preorder(node.right) if node.right
		end
	end

	def level_order(node = @root)
		if node.val #.present?
			level_order(node)
			puts(node.left.val) if node.left
			puts(node.right.val) if node.right
			# level_order(node.left) if node.left
			# level_order(node.right.right) if node.right
		end
	end

end

aa = BST.new(25)
aa.insert(15)
aa.insert(50)
aa.insert(10)
aa.insert(22)
aa.insert(35)
aa.insert(70)
aa.insert(4)
aa.insert(12)
aa.insert(18)
aa.insert(24)
aa.insert(31)
aa.insert(44)
aa.insert(66)
aa.insert(90)

p "==============="
p aa.level_order