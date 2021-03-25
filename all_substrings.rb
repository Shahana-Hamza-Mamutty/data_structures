def all_substrings(s)
	query_string = s.split('')
	substrings = []
	query_string.length.times do |i|
		p "======1"
		p i
		p query_string[0..(query_string.length-1-i)]

		query_string[0..(query_string.length-1-i)].each_with_index do |val, index|
			substrings << query_string[index..(index+i)]
		end
		p substrings
		p "=================="
	end
	substrings
end


s = gets.to_s.rstrip

result = all_substrings(s)

p result