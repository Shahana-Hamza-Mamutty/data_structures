def remove_duplicates(nums)
	if nums.length > 1
	    nums.each_with_index do |e, i|
	    	p "====="
	    	p i
	    	p nums
	        if i+1 < nums.length && nums[i+1] == e
	            nums.delete_at(i+1)
	        end
	        if i-1 >= 0 && nums[i-1] == e
	            nums.delete_at(i-1)
	        end        
	    end
	end
	return nums.length
end

nums = [0,0,0,0,0]
remove_duplicates(nums)
p nums