class Pe

	def start
		puts Time.new

		j = 1
		t = 0
		(1..100000).each do |i|
			t += j
			j += 1
			f = find_factors2(t)
			if f >= 100
				puts t.to_s + " " + f.to_s
			end
			if f >= 500
				break
			end
		end

		puts Time.new
	end

	def find_factors2(t)
		n = t
		initial_n = t
		num_factors = 1
		i = 2
		while i * i <= initial_n do
			power = 0
			while n % i == 0 do
				n = n / i
				power += 1
			end
			num_factors = num_factors * (power + 1)
			i += 1
		end
		if n > 1
			num_factors = num_factors * 2
		end
		num_factors
	end

	def find_factors(t)
		f = 0
		limit = (t / 2).ceil
		(2..limit).each do |i|
			if t % i == 0
				f += 1
			end
		end
		f + 2
	end
		
end

if __FILE__ == $0
	p = Pe.new
	p.start
end
