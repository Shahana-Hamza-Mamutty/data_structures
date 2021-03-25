def lc_sub_array(list)
	sum_till_now = 0
	max_sum = 0
	list.each_with_index do |ele, index|
		sum_till_now += ele
		if sum_till_now < 0
			sum_till_now = 0
		end
		if sum_till_now > max_sum
			max_sum = sum_till_now
		end
	end
	{ max_sum: max_sum }
end

aa = lc_sub_array([-2, -3, 4, -1, -2, 1, 5, -3])
p aa