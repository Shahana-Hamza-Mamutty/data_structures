# def findNumber(arr, k)
#     element_present = false

#     arr.each do |ele|
#     	if ele == k
#     		element_present = true
#     		break
#     	end
#     end

# end


# def oddNumbers(l, r)
# 	result = []
# 	(l..r).each do |e|
# 		if (e%2 > 0)
# 			result << e 
# 		end
# 	end
# 	result
# end

# puts oddNumbers(2, 5)
# def aaa
# 	a = 2437
# 	b = 875

# 	x = a
# 	y = b

# 	until (x == y) do
# 		if (x > y)
# 			x = x-y
# 		end
# 		if (x <y)
# 			y = y - x
# 		end
# 	end
#  	return x
# end

# puts aaa


# class Parent
# @@value = 4
# def self.value
# @@value
# end

# def self.inc_value
# @@value +1
# end
# end

# class Child < Parent
# @@value = 87
# end


def multiple_3?(n)
	(n % 3) == 0
end

def multiple_5?(n)
	(n % 5) == 0
end


def fizzBuzz(n)
	result = []
    (1..n).each do |i|
    	if multiple_3?(i) &&  multiple_5?(i)
    		result << "FizzBuzz"
    	elsif multiple_3?(i) && !multiple_5?(i)
    		result << "Fizz"
    	elsif !multiple_3?(i) && multiple_5?(i)
    		result << "Buzz"
    	else
    		result << i
    	end
    end

    result
end

puts fizzBuzz(15)















