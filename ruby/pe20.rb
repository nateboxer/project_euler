require 'date'

class Pe
	
	def start
		puts Time.new

		sum = 0
		d = DateTime.new(1901, 1, 1)
		while d.year <= 2000 && d.mon <= 12 && d.day <= 31 do
			if d.sunday? && d.day == 1
				sum += 1
			end
			d += 1
		end

		puts sum
		
		puts Time.new
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
