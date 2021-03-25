def duplicate_zeros(arr)
  n = 0
  while n < arr.length
    if arr[n] == 0
        arr.insert(n+1, 0)
        arr.pop
        n += 1
    end
    n += 1
  end
end

arr = [1,0,2,3,0,4,5,0]

duplicate_zeros(arr)

p arr