# Find the smallest number with 2^500500 divisors.
# Give your answer modulo 500500507.

# we're going to iterate 500500 times or some such
# big list of primes
# each time, go through the primes and pick the cheapest one to square
# but not actually square; it's complicated lol
# 2^1 multiplies by 2, but 2^3 multiplies by 4, and then 2^7 multiplies by 8
# etc where n^(m - 1) multiplies the factors by m
# so to go from 2^3 to 2^7, you say "well, we got 4 from this, it's worth 2 / 2^4 to pick 2 this time"

load 'euler.rb'

mod_total = 1
next_indeces = [0]
primes = primes_under(1e7)
prime_powers = Hash.new(0)
values = Hash.new { |hash, key| hash[key] = key }

# repeat 500500 times
# n * log(n) growth (or less)
# takes 8 seconds
500500.times do |i|
	primes_to_check = next_indeces.map { |i| primes[i] } 
	multiplier = primes_to_check.min_by { |prime| values[prime] }

	power = prime_powers[multiplier]

	next_indeces[Math.log(power + 1, 2).floor] += 1
	if next_indeces.last == 1
		next_indeces << 0
	end

	prime_powers[multiplier] = power * 2 + 1
	values[multiplier] = multiplier ** (prime_powers[multiplier] + 1)
	mod_total = mod_total * fast_exp_mod(multiplier, power + 1, 500500507) % 500500507
end

p mod_total
p next_indeces # looks like [500084, 396, 15, 4, 1, 0]
