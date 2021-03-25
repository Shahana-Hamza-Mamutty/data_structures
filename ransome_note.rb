#!/bin/ruby

require 'json'
require 'stringio'

# Complete the checkMagazine function below.
def check_magazine(magazine, note)
	magazine_hash = {}
	result = "Yes"
	magazine.each do |word|
		magazine_hash[word] = magazine_hash[word] ? magazine_hash[word] + 1 : 1
	end
	
	note.each do |word|


		if !magazine_hash[word] || magazine_hash[word] <= 0
			result = "No"
			break
		end

		magazine_hash[word] = magazine_hash[word]-1
	end

	result

end

mn = gets.rstrip.split

m = mn[0].to_i

n = mn[1].to_i

magazine = gets.rstrip.split(' ').map(&:to_s)

note = gets.rstrip.split(' ').map(&:to_s)

puts check_magazine(magazine, note)