class Pe
	
	def start
		puts Time.new

		@fsums = Array.new
		(0..9).each do |i|
			@fsums[i] = factorial(i)
		end
		
		sum = 0	
		(3..999999).each do |i|
			if i == sum_digit_factorials(i)
				puts i.to_s + "!"
				sum += i
			end
		end

		puts sum

		puts Time.new
	end

	def sum_digit_factorials(num)
		a = num.to_s.split("").map { |i| i = i.to_i }
		sum = 0
		a.each do |i|
			sum += @fsums[i] 
		end
		return sum
	end

	def factorial(num)
		return (1..num).inject(:*) || 1
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
