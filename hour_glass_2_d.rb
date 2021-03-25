def find_hour_glass(input_arr)
	max = -63
	hour_glasses = []
	max_hour_glass = []
	input_arr.each_with_index do |arr, index|
		break if index > 3

		start_row = input_arr[index]
		middle_row = input_arr[index + 1]
		last_row = input_arr[index + 2] 

    p "=====start_row"
    p start_row

		start_row.each_with_index do |ele, inner_index|
			break if inner_index > 3



			hour_glass = []
			ele_1_index = inner_index
			ele_2_index = inner_index + 1
			ele_3_index = inner_index + 2

      p ele_1_index
      p ele_2_index
      p ele_3_index

			hour_glass = [ele, start_row[ele_2_index], start_row[ele_3_index], 
                    middle_row[ele_2_index], 
                    last_row[ele_1_index], last_row[ele_2_index], last_row[ele_3_index]]


      p "=========hour_glass"
      p hour_glass
      hour_glasses << hour_glass

      hour_glass_sum = hour_glass.inject(:+)

      if  hour_glass_sum > max
        max = hour_glass_sum
        max_hour_glass = hour_glass
      end
		end
	end

  {max: max, max_hour_glass: max_hour_glass}
end


input_arr = [[1, 1, 1, 0, 0, 0], [0, 1, 0, 0, 0, 0], [1, 1, 1, 0, 0, 0], [0, 0, 2, 4, 4, 0], [0, 0, 0, 2, 0, 0], [0, 0, 1, 2, 4, 0]]

# 6.times do |i|
#     input_arr[i] = gets.rstrip.split(' ').map(&:to_i)
# end

p find_hour_glass(input_arr)