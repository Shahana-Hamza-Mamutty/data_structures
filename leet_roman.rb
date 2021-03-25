def calculate_roman(query_num)
	roman_mappings = {
		1000 => 'M',
		900 => 'CM',
		500 => 'D',
		400 => 'CD',
		100 => 'C',
		90 => 'XC',
		50 => 'L',
		40 => 'XL',
		10 => 'X',
		9 => 'IX',
		5 => 'V',
		4 => 'IV',
		1 => 'I'
	}

	result = ''
	remainder = query_num

	roman_mappings.each do |key, val|
		quotient = remainder / key

		next if quotient == 0

		result += (val * quotient)

		remainder = remainder % key

		break if remainder == 0
	end

	result
	
end


p calculate_roman(1994)