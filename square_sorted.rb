def sort_squares(arr)
  start_pointer = 0
  end_pointer = arr.length - 1
  result_arr = Array.new(arr.length)
  result_pointer = arr.length - 1

  while start_pointer <= end_pointer do 

    if arr[start_pointer].abs >= arr[end_pointer]
      result_arr[result_pointer] = arr[start_pointer] * arr[start_pointer]
      start_pointer += 1
    elsif arr[end_pointer] > arr[start_pointer].abs
      result_arr[result_pointer] = arr[end_pointer] * arr[end_pointer]
      end_pointer -= 1
    end

    result_pointer -= 1

  end

  result_arr

end

arr = [-4,-1,0,3,10]
p sort_squares(arr)