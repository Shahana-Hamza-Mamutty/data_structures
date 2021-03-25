def consecutive_sum(num)
	arr_hash = {}

  return 1 if (num == 1) || (num == 2)

	(1..((num/2)+1)).each do |n|
    next if n == 1
    if n == 2
      arr_hash[n] = [3]
    else
      arr_hash[n] = [n+n-1] + arr_hash[n-1].map {|v| v + n }
    end
	end

  count = 1

  arr_hash.each do |key, val|
    count += 1 if val.include? num
  end

  count

end


p consecutive_sum(3)

