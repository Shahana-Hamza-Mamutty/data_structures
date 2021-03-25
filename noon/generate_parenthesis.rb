def backtrack(result_arr, current_str, open_tag, close_tag, max)
  if current_str.length == max*2
    result_arr << current_str
    return
  end

  if open_tag < max 
    backtrack(result_arr, current_str+"(", open_tag+1, close_tag, max)
  end

  if close_tag < open_tag 
    backtrack(result_arr, current_str+")", open_tag, close_tag+1, max)
  end

end

result_arr = []
backtrack(result_arr, "", 0, 0, 2)
p result_arr