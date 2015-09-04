load "euler.rb"

def harshad?(num)
	num != 0 && num % digits_sum(num) == 0
end

def right_truncatable_harshad?(num)
	num == 0 || harshad?(num) && right_truncatable_harshad?(num / 10)
end

def strong_harshad?(num)
	harshad?(num) && sqrt_time_prime?(num / digits_sum(num))
end

def strong_right_truncatable_harshad_prime?(num)
	prime?(num) && strong_harshad?(num / 10) && right_truncatable_harshad?(num / 10)
end

# puts (10...1000000).select { |num|
# 	strong_right_truncatable_harshad_prime?(num)
# }.inject(:+)

# puts (10...1000000).count { |num|
# 	right_truncatable_harshad?(num) && strong_harshad?(num)
# }

def truncatable_harshad_prime_thingy_sum
	strong_harshads = []
	harshads = [0]
	14.times do
		new_harshads = []
		harshads.each do |harshad|
			10.times do |digit|
				new_harshad = harshad * 10 + digit
				if harshad?(new_harshad)
					new_harshads << new_harshad
					strong_harshads << new_harshad if strong_harshad?(new_harshad)
				end
			end
		end
		harshads = new_harshads
	end

	result = []
	strong_harshads.each do |harshad|
		10.times do |digit|
			potential_prime = harshad * 10 + digit
			result << potential_prime if sqrt_time_prime?(potential_prime)
		end
	end

	result.select { |n| n < 1e14 }.inject(:+)
end

puts truncatable_harshad_prime_thingy_sum