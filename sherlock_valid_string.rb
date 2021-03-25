def is_valid(s)
	count_hash = {}
	s.split('').each do |letter|
		count_hash[letter] = count_hash[letter] ? count_hash[letter]+1 : 1
	end

	max_count = 0
	min_count = count_hash.values.min
	count_of_max_repetation = 0
	count_of_min_repetation = 0
	result = "YES"

	return "NO" if count_hash.values.uniq.length > 2

	count_hash.each do |key, count|
		if count > max_count 
			max_count = count 
			count_of_max_repetation = 1
		elsif count == max_count
			count_of_max_repetation += 1
		else
			count_of_min_repetation += 1
		end

		if ((max_count - count > 1) || (max_count > count && count_of_max_repetation > 1)) && count_of_min_repetation > 1
			result = "NO"
			break
		end

		
	end

	result
end

s = gets.to_s.rstrip

result = is_valid(s)

puts result