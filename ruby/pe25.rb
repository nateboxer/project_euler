class Pe
	
	def start
		puts Time.new

		@term = 2

		fibo(1, 1)

		puts Time.new
	end

	def fibo(f1, f2)
		@term += 1
		f3 = f1 + f2
		if f3.to_s.length >= 1000
			puts @term.to_s + ": " + f3.to_s
			abort
		end
		fibo(f2, f3)	
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
