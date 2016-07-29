class Pe
	
	def start
		puts Time.new

		@options = 2
		@size = 2 
		@array_size = @size * @options

		# trick: you can only walk a max of @size for any option

		path = Array.new


		
		count = 1
		r_count = 0
		d_count = 0
		(0..@array_size).each do |i|
			if r_count < @size
				path[i] = "r"
				r_count += 1
			elsif d_count < @size
				path[i] = "d"
				d_count += 1
			end
		end

		print path

		
		puts Time.new
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
