def merge_sort(list)
	# p list.length
	# p list
	if list.length <= 1
		p "=============end=================="
		p list
		list
	else
		mid = list.length / 2

		p "==========list.length==============="
		p list.length 
		p mid
		# p mid
		left = merge_sort(list[0..mid-1])
		right = merge_sort(list[mid..list.length])
		p "-------left---------------"
		p left
		p "-------right---------------"
		p right
		merge(left, right)
	end
end

def merge(left, right)
	if left.empty?
		right
	elsif right.empty?
		left
	elsif left.first < right.first
		[left.first] + merge(left[1..left.length], right)
	else
		[right.first] + merge(left, right[1..right.length])
	end	
end

# l = [3,5,7,9]
# r = [1,2,4,5,8]
aa = merge_sort([54,26,93,17,77,31,44,55,20])

puts aa