def change_to_zig_zag(s, n)

  if s.length <= n || n == 1 
    return s
  end

  arr_matrix = Array.new(n){Array.new([])}
  query_string = s.split('')

  k = 0
  reverse = false

  query_string.each do |e|
    arr_matrix[k] << e

    if reverse
      k -= 1
    else
      k += 1
    end
    if k == n
      reverse = true
      k -= 2
    elsif k == -1
      reverse = false
      k += 2
    end
  end

  arr_matrix.map{|a| a.join('')}.join('')
end


p change_to_zig_zag("PAYPALISHIRING", 4)
