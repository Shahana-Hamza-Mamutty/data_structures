# Complete the maxSubsetSum function below.
def maxSubsetSum(arr)
	incl = arr[0]
	exc = 0

	arr.drop(1).each_with_index do |val, i|
		incl_new = exc + val
		exc = [incl, exc].max
		incl = incl_new
	end

	[exc, incl].max
end