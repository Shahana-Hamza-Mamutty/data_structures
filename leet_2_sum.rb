# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
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
nums = [3,3]
target = 6
p two_sum(nums, target)