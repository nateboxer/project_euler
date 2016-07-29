class Pe
	
	def start
		puts Time.new

		@a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

		@count = 0

		permute(0, "")

		puts Time.new
	end

	def permute(index, result)
		if index >= @a.length
			index = 0
		end
		if result.length < @a.length
			(0..(@a.length - 1)).each do |i|
				if !result.include?(@a[i].to_s)
					permute(i, result + @a[i].to_s)
				end
			end
		else
			@count += 1
			puts @count.to_s + ": " + result
			if @count == 1000000
				puts "FOUND: " + result
				abort
			end
		end
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
