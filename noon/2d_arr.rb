def find_hour_glass_max(two_d_arr)

  hr_glass_max = nil

  two_d_arr.each_with_index do |arr, index|
    break if index > 3

    arr.each_with_index do |val, i|
      break if i > 3

      pos_1 = arr[i]
      pos_2 = arr[i+1]
      pos_3 = arr[i+2]
      pos_4 = two_d_arr[index+1][i+1]
      pos_5 = two_d_arr[index+2][i]
      pos_6 = two_d_arr[index+2][i+1]
      pos_7 = two_d_arr[index+2][i+2]

      sum = pos_1 + pos_2 + pos_3 + pos_4 + pos_5 + pos_6 + pos_7

      hr_glass_max = !(hr_glass_max) || sum > hr_glass_max ? sum : hr_glass_max
    end
  end


  hr_glass_max

end


# two_d_arr = []

# 6.times do |i|
#   two_d_arr[i] = gets.rstrip.split(' ').map(&:to_i)
# end


two_d_arr = [[0, -4, -6, 0, -7, -6],
[-1, -2, -6, -8, -3, -1],
[-8, -4, -2, -8, -8, -6],
[-3, -1, -2, -5, -7, -4],
[-3, -5, -3, -6, -6, -6],
[-3, -6, 0, -8, -6, -7]]


p find_hour_glass_max(two_d_arr)


