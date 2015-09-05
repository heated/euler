def nim_win(a, b, c)
	a ^ b ^ c != 0
end

# runs in ~366 seconds vs 0.5 seconds in C
p (1..1e9).count { |n| !nim_win(n, 2 * n, 3 * n) }
