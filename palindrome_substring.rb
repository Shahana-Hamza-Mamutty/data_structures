def find_palindromic_substrings(n, s)
	query_string_array = s.split('')
	palindromic_substrings = n

	return (n*(n+1)/2) if query_string_array.uniq.length == 1

	

	query_string_array.each_with_index do |letter, index|
		next if index == 0
		left_index = index - 1
		rigt_index = index + 1

		while(query_string_array[left_index] && left_index >= 0)

			if (query_string_array[left_index] == letter && (index - left_index == 1))
				palindromic_substrings += 1
			end

			if (query_string_array[rigt_index] && (query_string_array[left_index] == query_string_array[rigt_index]))
				if(index - left_index > 1)
					palindromic_substrings += 1 if query_string_array[left_index] == query_string_array[left_index+1]
				else
					palindromic_substrings += 1
				end
				
				left_index -= 1
				rigt_index += 1
				
			else
				break
			end
		end
	end

	palindromic_substrings
end

n = gets.to_i

s = gets.to_s.rstrip

puts find_palindromic_substrings(n, s)