#!/bin/ruby

require 'json'
require 'stringio'

# Complete the twoStrings function below.
def twoStrings(s1, s2)
	count_hash = {}
	result = "NO"
	s1.each do |letter|
		count_hash[letter] = count_hash[letter] ? count_hash[letter] + 1 : 1
	end

	s2.each do |letter|
		if count_hash.has_key?(letter)
			result = "YES"
			break
		end
	end

	result
end

def calculate(strings_arr)
	res = []
	strings_arr.each do |arr|
		res << twoStrings(arr[0], arr[1])
	end
	res
end


q = gets.to_i
qs = []

q.times do |q_itr|

    s1 = gets.to_s.rstrip.split('')

    s2 = gets.to_s.rstrip.split('')

    qs << [s1, s2]
end

puts calculate(qs)

