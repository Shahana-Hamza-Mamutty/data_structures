#!/bin/ruby

require 'json'
require 'stringio'

# Complete the abbreviation function below.
def abbreviation(a, b)

	string_to_modify = a.split('')
	string_to_match = b.split('')
	hash_to_modify = {}
	hash_to_match = {}


	abbrv = true

	non_deleteable = string_to_modify.select{|val| /[[:upper:]]/.match(val) }

	p non_deleteable

	return "NO" if (non_deleteable - string_to_match).length > 0

	string_to_modify.each { |val| hash_to_modify[val] = (hash_to_modify[val] ? hash_to_modify[val]+1 : 1) }
	string_to_match.each { |val| hash_to_match[val] = (hash_to_match[val] ? hash_to_match[val]+1 : 1) }


	p hash_to_modify
	p hash_to_match
	hash_to_match.each do |key, val|
		p "=========================================="
		p key
		p val

		p "====4234======="
		p (hash_to_modify[key.downcase] || 0) 
		p (hash_to_modify[key.upcase] || 0)
		p (hash_to_modify[key.downcase] || 0) + (hash_to_modify[key.upcase] || 0)


		if !hash_to_modify[key.upcase] && !hash_to_modify[key.downcase]
			abbrv = false
			break
		end

		if hash_to_modify[key] && hash_to_modify[key] > val
			abbrv = false
			break
		end



		if ((hash_to_modify[key.downcase] || 0) + (hash_to_modify[key.upcase] || 0)) < val
			abbrv = false
			break
		end
	end

	return (abbrv ? "YES": "NO")
end

q = gets.to_i

result = []
q.times do |q_itr|
    a = gets.to_s.rstrip

    b = gets.to_s.rstrip

    result << abbreviation(a, b)
end

puts result
