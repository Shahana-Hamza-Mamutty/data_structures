# @return {Integer}
def find_numbers(nums)
    count = 0
    
    nums.each do |n|
        count += 1 if ((n.to_s.length) % 2) == 0
    end
    
    count
end

puts find_numbers([12,345,2,6,7896])