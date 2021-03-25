class HashTable

	attr_accessor :val, :next

	def initialize(keys, values)
		@size = 11
		@slots = Array.new(11)
		@data = Array.new(11)
	end

	def put(key, val)
		hash_value = hash_function(key)
		if @slots[hash_value].nil?
			@slots[hash_value] = key
			@data[hash_value] = val
		else
			if @slots[hash_value] == key
				@data[hash_value] = val
			else
				rehash_val = rehash(hash_value)
				until @slots[rehash_val].nil? || @slots[rehash_val] == key
				 	rehash_val = rehash(rehash_val)
				end 
				if @slots[rehash_val].nil?
					@slots[rehash_val] = key
					@data[rehash_val] = val
				else
					if @slots[rehash_val] == key
						@data[rehash_val] = val
					end
				end
			end
		end
	end

	def hash_function(key)
		key % @size
	end

	def rehash(prev_hash)
		(prev_hash + 1) % @size
	end


end

