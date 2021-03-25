class Queue

  def initialize(arr=[])
    @queue = arr
  end

  def enqueue(ele)
		@queue << ele
	end

  def dequeue
		@queue.shift
	end

 def is_empty
		@queue.length == 0
	end

	def size
		@queue.length
	end

end
