def swap(string, i, j)
	string_to_array = string.split('')
	tmp = string_to_array[i]
	string_to_array[i] = string_to_array[j]
	string_to_array[j] = tmp
	string_to_array.join('')
end

def calculate(str, left, right)
	if (left==right)
		p str
	else
		# p "============="
		
		(left..right).each do |i|
			# p "-----kk"
			# p left
			# p i
			
			
			swapped = swap(str, left, i)

			# p swapped

			# p right
			# p "-=============================-"
			calculate(swapped, left+1, right)
		end
	end

end

s = "abc"
calculate(s, 0, (s.length - 1))