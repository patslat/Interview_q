def check(array)
	nums = array
	repeat = Array.new

	# build an array of all possible combinations
	combinations = 1.upto(8).flat_map {|n| nums.combination(n).to_a}

	# get the sum of each combination (subset)
	sums = combinations.flat_map {|arr| arr.reduce(:+)}

	# count the frequencies of each sum
	frequencies = Hash.new(0)
	sums.each {|sum| frequencies[sum] += 1}

	# if frequency is > 1 for any sum, there are two subsets that are ==
	!(frequencies.values.max > 1)
end

# find_subset starts with an array of 1, and checks if
# if the array passes, the next number below the passing number is pushed into the array
# 	if the new number causes the array to fail the check, it is reduced by 1
# repeat until an array of 8 passing numbers is populated, then return
def find_subset
	set = [100]
	while set.length <= 8
		if check(set)
			set << (set[-1] - 1)
		else set[set.length - 1] -= 1
		end
	end
	set[0..7]
end