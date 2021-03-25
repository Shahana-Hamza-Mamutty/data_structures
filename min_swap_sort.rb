require 'json'
require 'stringio'

# Complete the minimumSwaps function below.
def minimumSwaps(arr)
	swap = 0
	hh = {}
	arr.each do |dd|
		hh[dd] = false
	end
	until (hh.values.uniq.length == 1) && (hh.values.uniq.include? true)
		arr.each_with_index do |ele, index|
			if index+1 != ele
				tmp = arr[ele-1]
				arr[ele-1] = ele
				arr[index] = tmp
				swap += 1
				if index+1 == tmp
					hh[tmp] == true
				end
			end
			hh[ele] = true
		end
	end
	swap
end


arr = [2,31,1,38,29,5,44,6,12,18,39,9,48,49,13,11,7,27,14,33,50,21,46,23,15,26,8,47,40,3,32,22,34,42,16,41,24,10,4,28,36,30,37,35,20,17,45,43,25,19]
res = minimumSwaps arr
p "========"
p res