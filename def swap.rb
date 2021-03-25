def swap(string, i, j)
	string_to_array = string.split('')
	tmp = string_to_array[i]
	string_to_array[i] = string_to_array[j]
	string_to_array[j] = tmp
end

def calculate(str, left, right)
	if (left==right)
		p str
	else
		(left..right).each do |i|
			swapped = swap(str, left, i)
			calculate(swapped, left+1, right)
		end
	end

end

s = "abc"
calculate(s, 0, (s.length - 1))