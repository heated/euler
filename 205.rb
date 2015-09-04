load "euler.rb"

cc_totals = Array.new(37, 0)
pp_totals = Array.new(37, 0)

def record_totals(dice, sides, total, record)
	if dice == 0
		record[total] += 1
	else
		(1 .. sides).each do |roll|
			record_totals(dice - 1, sides, total + roll, record)
		end
	end
end

record_totals(6, 6, 0, cc_totals)
record_totals(9, 4, 0, pp_totals)

success_space = sum( pp_totals.each_with_index.map { |weight, total| weight * sum( cc_totals.take(total) ) } )

total_space = 6 ** 6 * 4 ** 9
puts 1.0 * success_space / total_space
