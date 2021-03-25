def longest_palindrome(s)
  query_str = s.split('')
  str_len = s.length
  max_len = 0


  query_str.each_with_index do |ele, index|
    l = index - 1
    r = index + 1
    n = 1

    p "---------------------"
    p l
    p r
    p ele
    p query_str[l]
    p query_str[r]

    while l > 0 && r < str_len && query_str[l] == query_str[r]
      p "======in"
      n += 2
      l -= 1
      r += 1
    end

    max_len = n if n > max_len

  end

  max_len
end

s = "babad"

p longest_palindrome(s)