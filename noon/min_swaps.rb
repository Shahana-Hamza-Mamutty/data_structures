def min_swaps(arr)

  swaps = 0
	arr.each_with_index do |val, index|
    actual_pos = val - 1

    next if actual_pos == index

    current_pos = index

    while current_pos != actual_pos
      # tmp = arr[actual_pos]
      arr[actual_pos], arr[current_pos] = val, arr[actual_pos]
      swaps += 1
      val = arr[current_pos]
      actual_pos = val - 1
    end
	end

  swaps
end

aa = [7, 1, 3, 2, 4, 5, 6]

puts min_swaps(aa)