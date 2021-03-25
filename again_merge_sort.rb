


def merge_sort(arr)
	if arr.length < 2
		return arr
	end

	mid = arr.length/2


	left = merge_sort(arr[0..(mid-1)])
	right = merge_sort(arr[mid..arr.length])
	merge(left, right)
end


def merge(left, right)
	if left.empty?
		return right
	elsif right.empty?
		return left
	elsif left.first < right.first
		[left.first] + merge(left[1..left.length], right)
	else
		[right.first] + merge(left, right[1..right.length])
	end						
end


pp merge_sort([54,26,93,17,77,31,44,55,20])