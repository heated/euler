load 'euler.rb'

def odd_digits?(n)
	digits(n).all?(&:odd?)
end

# estimated to run in 700 seconds vs 1 second for 145.c
result = (10..1e8).count do |n|
	n % 10 != 0 && odd_digits?(n + reverse_int(n))
end

p result
