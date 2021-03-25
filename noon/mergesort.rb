def merge_sort(arr)

  length = arr.length
  if length <= 1
    return arr
  else
    mid = length/2
    
    left = merge_sort(arr[0..(mid-1)])
    right = merge_sort(arr[mid..(length-1)])

    merge(left, right)
  end
end

def merge(left, right)
  if right.length == 0
    return left
  elsif left.length == 0
    return right
  elsif left.first < right.first
    [left.first] + merge(left[1..(left.length-1)], right)
  elsif right.first < left.first
    [right.first] + merge(left, right[1..(right.length-1)])
  end
end

aa = merge_sort([54,26,93,17,77,31,44,55,20])

puts aa