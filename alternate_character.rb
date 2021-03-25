
def alternating_characters(s)
	query_string = s.split('')
	prev_letter = query_string[0]
	deletions = 0

	query_string.shift(1)

	query_string.each do |current_letter|
		deletions += 1 if prev_letter == current_letter
		prev_letter = current_letter
	end

	deletions
end

q = gets.to_i
result = []

q.times do |q_itr|
    s = gets.to_s.rstrip

    result << alternating_characters(s)
    
end

puts result