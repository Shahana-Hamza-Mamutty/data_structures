# @param {String} digits
# @return {String[]}

def letter_combinations(number)
	letter_mappings = [0,1,'abc','def','ghi', 'jkl', 'mno', 'pqrs', 'tuv', 'wxyz']

	result = []

	number.to_s.split('').each_with_index do |ele, index|

		elems = letter_mappings[ele.to_i].split('')

		if index ==0
			result = elems
			next
		end

		new_combs = []

		result.each do |r|
			elems.each do |e|
				new_combs << r+e
			end
		end

		result = new_combs
	end

	result
end