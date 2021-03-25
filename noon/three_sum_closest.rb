def three_sum(nums)
  nums = nums.sort
  len = nums.length
  res = []

  nums.each_with_index do |val, index|
    next if index > 0 && nums[index -1] == nums[index]
    break if (index + 3 > len)

     p "==="
    p index
    p index - 1
    p nums[index - 1]
    p nums[index]

    bal = 0 - val

    l = index + 1
    r = len - 1

    while l < r 
      if (nums[l] + nums[r]) == bal
        res << [val, nums[l], nums[r]]
        l += 1
        r -= 1
      elsif (nums[l] + nums[r]) > bal
        r -= 1
      elsif (nums[l] + nums[r]) < bal
        l += 1
      end
    end
  end

  res.uniq
end

nums = [1,1,1,0]
target = 1

p three_sum_closest(nums, target)