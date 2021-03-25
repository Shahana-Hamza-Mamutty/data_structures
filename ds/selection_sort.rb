def selecetion_sort(arr)
	len = arr.length
	len.times do |i|
		for j in i+1..len - 1
			if arr[i] < arr[j]
				arr[i], arr[j] = arr[j], arr[i]
			end
		end
	end
	arr
end

res = selecetion_sort([54,26,93,17,77,31,44,55,20])
p res