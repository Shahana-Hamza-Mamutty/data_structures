def lcs(a,b)
	a = a.split('')
	b = b.split('')
	num = Array.new(a.size){Array.new(b.size, 0)}
	a.each_with_index do |val_1, i|
		b.each_with_index do |val_2, j|
			if i == 0 || j == 0
				if a[i] == b[j]
					num[i][j] = 1
				else
					num[i][j] = num[i][j-1] unless num[i][j-1].nil?
				end 
			elsif a[i] == b[j]
				num[i][j] = num[i-1][j-1] + 1
			elsif a[i] != b[j]
				num[i][j] = [num[i][j-1], num[i-1][j]].max
			end	
		end
	end
	num.last.last
end

puts lcs("AGGTAB","GXTXAYB")
puts "yaaayyy"