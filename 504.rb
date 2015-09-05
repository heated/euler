load 'euler.rb'

# runs in 80 seconds
# given x and y intercepts for a line, how many lattice points are there under the line?
# 1 < x < y < 100
# for each column: find greatest n such that -n * x / y + y > 0

def perfect_square?(n)
	m = Math.sqrt(n).floor
	m * m == n
end

max = 100
total = 0

latice_triangles = Array.new(max + 1) { [] }

for x in 1..max
	for y in 1..max
		latice_triangles[x][y] = ((x - 1) * (y - 1) - x.gcd(y) + 1) / 2
	end
end

for a in 1..max
	for b in 1..max
		for c in 1..max
			for d in 1..max
				total_latice_points = -3 + a + b + c + d +
					latice_triangles[a][b] +
					latice_triangles[b][c] +
					latice_triangles[c][d] +
					latice_triangles[d][a]

				if perfect_square?(total_latice_points)
					total += 1
				end
			end
		end
	end
end

p total
