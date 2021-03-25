def max_area(heights)

	max_area = 0

	i = 0
	j = heights.length - 1

	while(i < j)
		if heights[i] < heights[j]
			max_area = [max_area, heights[i]*(j-i)].max
			i += 1
		else
			max_area = [max_area, heights[j]*(j-i)].max
			j -= 1
		end
	end

	max_area
end
 p max_area([1,8,6,2,5,4,8,3,7])

#  def merge_sort(list)
# 	# p list.length
# 	# p list
# 	if list.length <= 1
# 		list
# 	else
# 		mid = list.length / 2
# 		# p mid
# 		left = merge_sort(list[0..mid-1])

# 		p left
# 		p "--------------rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
# 		right = merge_sort(list[mid..list.length])
# 		p "-------rrrr---------------"
# 		# p left
# 		p right
# 		aa = merge(left, right)
# 		p aa
# 		aa
# 	end
# end

# def merge(left, right)
# 	if left.empty?
# 		right
# 	elsif right.empty?
# 		left
# 	elsif left.first < right.first
# 		[left.first] + merge(left[1..left.length], right)
# 	else
# 		[right.first] + merge(left, right[1..right.length])
# 	end	
# end

# # l = [3,5,7,9]
# # r = [1,2,4,5,8]
# aa = merge_sort([54,26,93,17,77,31,44,55,20])

# puts aa