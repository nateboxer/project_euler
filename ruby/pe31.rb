class Pe
	
	def start
		puts Time.new

		@target = 200 
		@coins = [200, 100, 50, 20, 10, 5,  2,   1]
		@lims =  [1,   2,   4,  10, 20, 40, 100, 200]

		count = 0

		(0..@lims[0]).reverse_each do |c0|
			if c0*@coins[0] > @target 
				next 
			end
			(0..@lims[1]).reverse_each do |c1|
				if c0*@coins[0] + c1*@coins[1] > @target 
					next 
				end
				(0..@lims[2]).reverse_each do |c2|
					if c0*@coins[0] + c1*@coins[1] + c2*@coins[2] > @target 
						next 
					end
					(0..@lims[3]).reverse_each do |c3|
						if c0*@coins[0] + c1*@coins[1] + c2*@coins[2] + c3*@coins[3] > @target 
							next 
						end
						(0..@lims[4]).reverse_each do |c4|
							if c0*@coins[0] + c1*@coins[1] + c2*@coins[2] + c3*@coins[3] + c4*@coins[4] > @target 
								next 
							end
							(0..@lims[5]).reverse_each do |c5|
								if c0*@coins[0] + c1*@coins[1] + c2*@coins[2] + c3*@coins[3] + c4*@coins[4] + c5*@coins[5] > @target 
									next 
								end
								(0..@lims[6]).reverse_each do |c6|
									if c0*@coins[0] + c1*@coins[1] + c2*@coins[2] + c3*@coins[3] + c4*@coins[4] + c5*@coins[5] + c6*@coins[6] > @target 
										next 
									end
									(0..@lims[7]).reverse_each do |c7|
										sum = c0 * @coins[0] + 
											c1 * @coins[1] + 
											c2 * @coins[2] + 
											c3 * @coins[3] + 
											c4 * @coins[4] + 
											c5 * @coins[5] + 
											c6 * @coins[6] +
											c7 * @coins[7]
										if sum == @target
											count += 1
										end
									end
								end
							end
						end
					end
				end
			end
		end

		puts (count)

		puts Time.new
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
