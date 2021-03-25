def three_sum(nums)
  result = []

  return result if nums.length < 3

  count_hash = {}
  query_array = []

  nums.each do |num|
    count_hash[num] = count_hash[num] ? count_hash[num]+1 : 1
    query_array << num unless count_hash[num] > 3
  end
  query_array = query_array.sort

  query_array.each_with_index do |val, index|
    next if index > 0 && query_array[index -1] == query_array[index]
    # next if val == 0

    balance = 0 - val
    valid_set = nil

    query_array.each_with_index do |num, i|
      next if i == index

      valid_set = nil

      second_balance = balance - num

      if count_hash[second_balance] && (second_balance == num) && (second_balance == val)
        if count_hash[second_balance] > 2
          valid_set = [val, num, second_balance]
        end
      elsif count_hash[second_balance] && (second_balance == num)|| (second_balance == val)
        if count_hash[second_balance] > 1
          valid_set = [val, num, second_balance]
        end
      elsif count_hash[second_balance]
        valid_set = [val, num, second_balance] 
      end

      sorted = valid_set ? valid_set.sort : nil
      result << sorted if sorted && !result.include?(sorted)
    end
    

  end

  result
end

nums = [-1,0,1,2,-1,-4]
p three_sum(nums)