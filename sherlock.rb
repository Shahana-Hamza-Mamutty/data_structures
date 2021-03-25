# Complete the sherlockAndAnagrams function below.
def sherlockAndAnagrams(s)

	query_string = s.rstrip.split('')

	if query_string.length == query_string.uniq.length
		return 0
	end

	substring_hash = {}

	query_string_length = query_string.length
	a = []
	query_string_length.times do |i|
		query_string.each_with_index do |val, index|
			break if (query_string_length - (index + 1) < i)

			a << query_string[index..(index+i)].inject(&:+)

		end
	end
	ana = 0
	a.each do |ele|
		e = ele.split('').sort.inject(&:+)
		substring_hash[e] = substring_hash[e] ? (substring_hash[e] + 1) : 1
	end

	substring_hash.each do |key, val|
		ana = ana + ((val*(val-1))/2) if val > 1
	end

	return ana
end

q = gets.to_i

q.times do |q_itr|
    s = gets.to_s.rstrip

    result = sherlockAndAnagrams s

    p result
end