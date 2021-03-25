require 'json'
require 'stringio'

# Complete the hourglassSum function below.
def hourglassSum(arr)
    res = []
    max = nil
    data = []
    arr.each_with_index do |row, main_index|
    	next if main_index > 3

       row.each_with_index do |ele, index|

       		next if index > 3
            res << ele
            res << row[index+1]
            res << row[index+2]
            second_row = arr[main_index+1]
            res << second_row[(index + (index+2))/2]
            third_row = arr[main_index+2]
            res << third_row[index]
            res << third_row[index+1]
            res << third_row[index+2]

	        if max.nil? || max < res.inject(:+)
	            max = res.inject(:+)
	        end
	        res =[]
       end

    end
    max
end

gg = ["-1 -1 0 -9 -2 -2", "-2 -1 -6 -8 -2 -5", "-1 -1 -1 -2 -3 -4", "-1 -9 -2 -4 -4 -5", "-7 -3 -3 -2 -9 -9", "-1 -3 -1 -2 -4 -5"]
arr = Array.new(6)
gg.each_with_index do |i, index|
    arr[index] = i.split(' ').map(&:to_i)
end

result = hourglassSum arr

puts result