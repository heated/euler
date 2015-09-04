load "euler.rb"

# runtime is 90 seconds for 1e8 vs 3 seconds for 357.c
results = primes_under(1e8).map(&:pred).select do |n|
	prime?(2 + n / 2) && (3 .. Math.sqrt(n).floor).all? do |f|
		n % f != 0 or prime?(f + n / f)
	end
end

p sum(results)