# Complete the countTriplets function below.
def countTriplets(arr, r)

	triplets = 0

	left_hash = {}
	right_hash = {}

	arr.each do |val, index|
		right_hash[val] = right_hash[val] ? (right_hash[val]+1) : 1
	end

	# triplets = 0

	arr.each_with_index do |g, i|
		middle_value = g
		left_value = g % r == 0 ? g/r : g/r.to_f
		right_value = g*r

		right_hash[g] = right_hash[g]-1

		triplets += (left_hash[left_value] || 0) * 1 * (right_hash[right_value] || 0)
		
		left_hash[g] = left_hash[g] ? (left_hash[g] + 1) : 1
	end

	triplets

end

nr = gets.rstrip.split

n = nr[0].to_i

r = nr[1].to_i

arr = gets.rstrip.split.map(&:to_i)

ans = countTriplets arr, r

puts ans

