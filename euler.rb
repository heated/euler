require 'benchmark'

def sieve(upto)
	upto = upto.to_i
	prime = Array.new(upto, true)
	prime[0] = false
	prime[1] = false

	2.upto(Math.sqrt(prime.size)) do |i|
		if prime[i]
			(i ** 2 ... upto).step(i) do |n|
				prime[n] = false
			end
		end
	end

	prime
end

def find_primes_under(n)
	$prime = sieve(n)
end

def prime?(num)
	$prime[num]
end

def primes_under(n)
	find_primes_under(n)
	$prime.each_index.select { |i| $prime[i] }
end

def sqrt_time_prime?(n)
	n > 1 && !(2 .. Math.sqrt(n).floor).any? { |f| n % f == 0 }
end

def digit_count(num)
	Math.log10(num).floor + 1
end

def digits(num)
	if num < 10
		[num]
	else
		digits(num / 10) + [num % 10]
	end
end

def base10_to_int(digits_array, base)
	if digits_array.empty?
		0
	else
		digits_array.last + base * base10_to_int(digits_array[0..-2], base)
	end
end

def reverse_int(n)
	base10_to_int(digits(n).reverse, 10)
end

def digits_sum(num)
	sum(digits(num))
end

def sum(array)
	array.inject(0, :+)
end

def fast_exp_mod(base, power, divisor)
	if power == 0
		1
	elsif power.even?
		fast_exp_mod((base * base) % divisor, power / 2, divisor) % divisor
	else
		(base * fast_exp_mod(base, power - 1, divisor)) % divisor
	end
end

# fermat's little theorem
# a^p     = a   (mod p)
# a^(p-2) = 1/a (mod p)
# logarithmic time
def mod_inverse(n, divisor)
	fast_exp_mod(n, divisor - 2, divisor)
end

def prime_factors(n)
	factors = []
	m = 2

	while m <= Math.sqrt(n)
		if n % m == 0
			factors << m
			n /= m
		else
			m += 1
		end
	end

	factors + [n]
end

def run_length(arr)
	encoded = []
	current_el = arr[0]
	times_seen = 1
	for i in 1...arr.size
		if arr[i] == current_el
			times_seen += 1
		else
			encoded << [current_el, times_seen]
			current_el = arr[i]
			times_seen = 1
		end
	end
	encoded << [current_el, times_seen]
	encoded
end

def run_length_prime_factorization(n)
	run_length(prime_factors(n))
end

# assumes run length factorization encoding
def prime_factorization_to_factors(factorization)
	if factorization.empty?
		[1]
	else
		prime_factor, multiplicity = factorization[0]
		factors = prime_factorization_to_factors(factorization.drop(1))
		multiplicity_array = Array.new(multiplicity + 1) { |i| prime_factor ** i }
		factors.map { |factor| multiplicity_array.map { |multiple| multiple * factor } }.flatten
	end
end

def factors(n)
	prime_factorization_to_factors(run_length_prime_factorization(n))
end

def factorial(n)
	if n == 0
		1
	else
		n * factorial(n - 1)
	end
end
