load "euler.rb"

def specific_factorial_sum_mod(p)
	(mod_inverse(8, p) * -3) % p
end

# took 85 seconds vs 7 seconds for 381.c
puts sum( primes_under(1e8).drop(2).map { |prime| specific_factorial_sum_mod(prime) } )
