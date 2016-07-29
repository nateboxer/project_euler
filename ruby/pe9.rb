class Pe9

	def start
		puts Time.new

		found_it = false
		(1..1000).each do |a|
			((a+1)..1000).each do |b|
				((b+1)..1000).each do |c|
					if (a*a) + (b*b) == c*c
						if a + b + c == 1000
							puts a.to_s + " " + b.to_s + " " + c.to_s
							found_it = true
							break	
						end
					end
				end
				if found_it
					break
				end
			end
			if found_it
				break
			end
		end
			
		puts Time.new
	end

end

if __FILE__ == $0
	p = Pe9.new
	p.start
end
