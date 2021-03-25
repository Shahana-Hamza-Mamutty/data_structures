def quick_sort(arr)
  i = 1
  j = arr.length - 1
  pivot = arr[i]
  while i < j
    while arr[i] < pivot
      i += 1
    end
    while arr[j] > pivot
      j -= 1
    end

    if i < j
      temp = arr[j]
      arr[j] = arr[i]
      arr[i] = temp
      i += 1
      j -= 1
    end
  end

  p arr
end


a = [10, 16, 8, 12, 15, 6, 3, 9, 5]
quick_sort(a)
