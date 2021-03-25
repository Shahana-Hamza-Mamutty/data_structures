def max_overlap(arrival, exit_arr)
	arrival = arrival.sort
	exit_arr = exit_arr.sort
	i = 0
	j = 0
	in_count = 0
	max_val = 0
	max_time = 0


	while i < arrival.length &&  j < arrival.length
		if arrival[i] <= exit_arr[j]
			in_count += 1
			if in_count > max_val
				max_val = in_count
				max_time = arrival[i]
			end
			i += 1	
		else
			in_count -= 1
			j += 1
		end
	end
	{max_val: max_val, max_time: max_time}
end

aa = max_overlap([1, 2, 10, 5, 5], [4, 5, 12, 9, 12])
p aa