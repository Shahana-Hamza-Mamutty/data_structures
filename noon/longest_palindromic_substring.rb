def longest_palindromic_substring(str)
  str_arr = str.split('')
  str_length = str.length
  longest_palindrome = ''

  str_arr.each_with_index do |val, index|
    l = index - 1
    r = index + 1

    palindrome = val
    left_only = true

    while l >= 0 && r <= str_length

      if str_arr[l] == str_arr[r]
        palindrome = str_arr[l] + palindrome + str_arr[r]
        l -= 1
        r += 1
        left_only = false
      elsif (str_arr[l] == str_arr[l+1]) && left_only
        palindrome = str_arr[l] + palindrome
        l -= 1
      else
        break
      end
    end

    longest_palindrome = palindrome.length > longest_palindrome.length ? palindrome : longest_palindrome
  end

  longest_palindrome
end

p longest_palindromic_substring("cbbdbbd")