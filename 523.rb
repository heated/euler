# There are two different obvious ways to solve this problem recursively.
# One way, the way i solved it, is to notice that for a list L of length N and an
# index I of the greatest element G, the expected number of steps E to sort L is:
# The number of steps to sort everything before I: E(I) +
# The number of steps to push G to the end: (N-I-1) + 
# The number of steps to sort each element after G into a sorted list before G

max = 30
expected_value = [0, 0]

for n in 2..max
	total_steps = 0

	for diff in 0...n
		before_biggest = n - diff - 1
		total_steps += diff + expected_value[before_biggest]
		for step in 0...diff
			size = before_biggest + step + 1
			total_steps += (2.0 ** size - 1) / size - 1
		end
	end

	expected_value[n] = total_steps / n
end

p expected_value[max].round(2)

# The second, simpler way is to notice that E(N) = E(N-1) + the expected steps it takes
# to sort the last element E into a sorted list E(N-1). If E is N, it takes 0 steps.
# Otherwise, it takes 2^E - 1 steps. Averaging the steps gives us 2^N / N - 1.


E = [0]
for n in 1..max
	E[n] = E[n-1] + (2.0 ** (n-1) - 1) / n
end

p E[max].round(2)


# and now on one line:
p (1..30).map { |n| (2.0 ** (n-1) - 1) / n }.inject(:+).round(2)
