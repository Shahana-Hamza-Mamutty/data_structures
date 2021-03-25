# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
	return 1 if s.length == 1
	string_array = s.split('')
	index_hash = {}
	max_ss_len = 0
	string_array.each_with_index do |val, index|
		 if index_hash[val] && index_hash[val] == index
		 	next
		 end
		i = index

		while(index_hash[string_array[i]].nil? && (i <= (string_array.length - 1) ))

			index_hash[string_array[i]] = i
			i += 1
		end 


		max_ss_len = index_hash.length if index_hash.length > max_ss_len

		if(i <= (string_array.length - 1))

			nodes_to_del = index_hash[string_array[i]]

			index_hash.delete_if{ |k, v| v <= nodes_to_del}

			index_hash[string_array[i]] = i	
		end

		break if i >= (string_array.length - 1)	
		
	end

	max_ss_len
    
end

p length_of_longest_substring("abcabcbb")