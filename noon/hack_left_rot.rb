# 1 2 3 4 5

# 0 1 2 3 4

# last_index = 4

# pos = 0 , val = 1 , i = 1 

# new_pos = 2
# 2 1 4 5

# pos = 2, val = 3, i = 2

# new_pos = 4
# nil 2 1 4 3

# pos = 4, val 5, i = 3

# new_pos = 4 + 2 >= 5,   6 - 5 = 1

# nil 5 1 4 3

# pos = 1, val = 2, i = 4

# new_pos = 1 + 2 = 3

# nil 5 1 2 3

# pos = 3, val = 4, i = 5

# new_pos = 3 + 2 >= 5, 5 - 5 = 0
# 4 5 1 2 3


d = 10
a = [41, 73, 89, 7, 10, 1, 59, 58, 84, 77, 77, 97, 58, 1, 86, 58, 26, 10, 86, 51]
n = a.length


i = 0, 

[41, 73, 89, 7, 10, 1, 59, 58, 84, 77, 41, 97, 58, 1, 86, 58, 26, 10, 86, 51]


i= 1

pos = 10, val = 77

[41, 73, 89, 7, 10, 1, 59, 58, 84, 77, 41, 97, 58, 1, 86, 58, 26, 10, 86, 51] 

i = 2



pos = 0
val = a[0]
# n.times do |i|
	
# 	new_pos = pos+d >= n ? (pos+d)-n : pos+d

# 	tmp = a[new_pos]
# 	a[new_pos] = val

# 	val = tmp
# 	pos = new_pos	

# 	p "========pp==============="
# 	p val
# 	p pos
# end



n.times do |i|

	pos = pos >= i ? pos : i
	
	new_pos = pos-d < 0 ? (n - (pos-d).abs) : pos-d

	tmp = a[new_pos]
	a[new_pos] = val

	val = tmp
	pos = new_pos	
end


p a
