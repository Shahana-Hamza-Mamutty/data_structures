def longest_palindrome(s)
  query_str = s.split('')
  str_len = s.length

  max_len = 0
  ss = ''



  query_str.each_with_index do |ele, index|
    l = index - 1
    r = index + 1
    n = 1
    res = ele

    while l >= 0 && r < str_len

      if query_str[l] == query_str[r]
        res = query_str[l] + res + query_str[r]
        n += 2
        l -= 1
        r += 1

        
      elsif ele == query_str[r]
        n += 1
        res = res + query_str[r]
        break
      else
        break
      end
    end

    ss = res if n > max_len
    max_len = n if n > max_len

  end

  ss
end

s = "bb"

p longest_palindrome(s)