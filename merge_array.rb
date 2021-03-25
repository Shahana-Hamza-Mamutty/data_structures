def merge(nums1, m, nums2, n)
  i = 0
  j = 0
  temp = nums1
  while j < n && i < m+n
    if nums1[i] >= nums2[j]  || (nums1[i] == 0 &&  (i - j) ==  m)

      nums1.insert(i, nums2[j])

      j += 1
      nums1.pop
    end
      i += 1
  end
end



# m = 3
# nums2 = [2,5,6]
# n = 3

nums1 = [-1,0,0,0,3,0,0,0,0,0,0]
m=5
nums2=[-1,-1,0,0,1,2]
n=6


merge(nums1, m, nums2, n)

p nums1