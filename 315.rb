load 'euler.rb'

def digital_roots_of(n)
	if n < 10
		[n]
	else
		[n] + digital_roots_of(digits_sum(n))
	end
end

layout = [
	[1, 1, 1, 0, 1, 1, 1],
	[0, 0, 1, 0, 0, 1, 0],
	[1, 0, 1, 1, 1, 0, 1],
	[1, 0, 1, 1, 0, 1, 1],
	[0, 1, 1, 1, 0, 1, 0],
	[1, 1, 0, 1, 0, 1, 1],
	[1, 1, 0, 1, 1, 1, 1],
	[1, 1, 1, 0, 0, 1, 0],
	[1, 1, 1, 1, 1, 1, 1],
	[1, 1, 1, 1, 0, 1, 1]
]

diff = Array.new(10) { [] }

for i in 0..9
	for j in 0..9
		diff[i][j] = 0
		for k in 0..6
			diff[i][j] += 2 * layout[i][k] * layout[j][k]
		end
	end
end

primes = primes_under(2e7).select { |n| n > 1e7 }
power_cost_diff = 0

primes.each do |p|
	digit_roots = digital_roots_of(p)
	number_digits = digit_roots.map { |n| digits(n) }

	(digit_roots.size - 1).times do |i|
		longer = number_digits[i]
		shorter = number_digits[i + 1]
		offset = longer.size - shorter.size

		shorter.size.times do |j|
			power_cost_diff += diff[ shorter[j] ][ longer[offset + j] ]
		end
	end
end

p power_cost_diff
