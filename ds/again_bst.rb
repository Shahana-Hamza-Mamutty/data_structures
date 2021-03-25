class Node

	attr_accessor :root_val, :left, :right

	def initialize(root, left=nil, right=nil)
		@root_val = root
		@left = left
		@right = right
	end

end

class BST

	def initialize(root=nil)
		@root = Node.new(root)
	end

	def insert(element, root = @root)

		# p "========================"
		# p root.root_val
		if element <= root.root_val
			if !root.left.nil?
				insert(element, root.left)
			else
				root.left = Node.new(element)
			end
		else
			if !root.right.nil?
				insert(element, root.right)
			else
				root.right = Node.new(element)
			end
		end			
	end 

	def inorder(root=@root)
		inorder(root.left) if root.left
		puts root.root_val
		inorder(root.right) if root.right			
	end

	def preorder(root=@root)
		puts root.root_val
		preorder(root.left) if root.left
		preorder(root.right) if root.right			
	end

	def postorder(root=@root)
		preorder(root.left) if root.left
		preorder(root.right) if root.right		
		puts root.root_val	
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

p aa.inorder