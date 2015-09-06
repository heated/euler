max = 30
E = Array.new(max + 1, 0)

for n in 2..max
	for d in 0...n
		E[n] += E[d]
		for s in n - d...n
			E[n] += (2.0 ** s - 1) / s
		end
	end
	E[n] /= n
end

puts E[max].round(2)
