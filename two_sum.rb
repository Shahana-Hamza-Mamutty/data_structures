# def two_sum(arr, target)
#   a_to_h = {}
#   result = []

#   arr.each_with_index do |val, index|
#     a_to_h[val] = {val: (target - val), pos: index}
#   end

#   a_to_h.each do |key, data|
#     pair_data = a_to_h[data[:val]]
#     if pair_data
#       result << data[:pos]
#       result << pair_data[:pos]
#       break
#     end
#   end

#   result
# end


def two_sum(nums, target)
    position_hash = {}
    result = nil
    nums.each_with_index do |num, index|

      comp = target - num

      if position_hash.key(comp)
        result = [position_hash.key(comp), index]
        break
      end
        position_hash[index] = num
    end
        
    result
    
end

nums = [2,7,11,15]
target = 9
p two_sum(nums, target)


