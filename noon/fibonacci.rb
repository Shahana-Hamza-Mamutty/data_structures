def fibo(n, memo)
  if memo[n] 
    return memo[n]
  elsif n == 1 || n == 2
    result = 1
  else
    result = fibo(n-1, memo)+fibo(n-2, memo)
  end

  memo[n] = result
  # p result
  return result
end

memo = []

a = fibo(5, memo)
p memo