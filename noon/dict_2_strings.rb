def common_ss(str1, str2)
  str1_arr = str1.split('')
  str2_arr = str2.split('')

  res = (str1_arr & str2_arr).length > 0 ? "YES" : "NO"

  res
end


# result = []

# q = gets.to_i
# query_strings = []
# q.times do