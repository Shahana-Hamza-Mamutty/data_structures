def fact(n)
	if n <= 1
		return 1
	else
		return n*fact(n-1)
	end 
end

def fibo(n)
	
	if n >= 3
		return (fibo(n-2) + fibo(n-1))
	else
		return 1
	end
end

 p fibo(5)