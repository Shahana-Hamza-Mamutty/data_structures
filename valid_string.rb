#!/bin/ruby

require 'json'
require 'stringio'

# Complete the arrayManipulation function below.
def isValid(s)
	arr = s.split("")
	aa = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
	gg = aa.values.uniq
	if gg.length > 2
		"NO"
	elsif gg.length == 1
		"YES"
	else
		pp = aa.values.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		keys = pp.keys.sort
		values = pp.values.sort
		if ( keys[1] - keys[0] == 1) && (values[0] == 1) || ((values[0] == 1) && keys[0] == 1)
			"YES"
		else
			"NO"
		end
	end	

end


result = isValid "aabbcd"
p "----------------"
p result