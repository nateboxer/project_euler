class Pe
	
	def start
		puts Time.new

		puts "Finding abundants..."

		abundant = Array.new
		(12..28123).each do |i|
			f = find_factors(i)
			sum = f.inject(0) { |s, f| s + f }
			if sum > i
				abundant.push(i)
			end
		end

		puts "Found: " + abundant.length.to_s

		puts "Searching integers..."
		
		sum = 0
		(1..28123).each do |i|

			can_sum = false

			i1 = abundant.length - 1
			a1 = abundant[i1]
			while a1 >= 0 && !can_sum do

				i2 = 0 
				a2 = abundant[i2]
				while a1 + a2 <= i && !can_sum do

					if a1 + a2 == i
						can_sum = true
						break
					end
					
					i2 += 1
					if i2 >= abundant.length 
						break
					end
					a2 = abundant[i2]
				end

				i1 -= 1
				a1 = abundant[i1]
			end

			if !can_sum
				sum += i
				puts i
			end

		end

		puts sum
				
		puts Time.new
	end

	def find_factors(t)
		f = Array.new
		f.push(1)
		limit = (t / 2).ceil
		(2..limit).each do |i|
			if t % i == 0
				f.push(i)
			end
		end
		f
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
