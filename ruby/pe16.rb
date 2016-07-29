class Pe
	
	def start
		puts Time.new
	
		puts one_to_nine

		puts Time.new
	end

	def one_to_nine
		s = "onetwothreefourfivesixseveneightnine"
		s.length
	end
		
end

if __FILE__ == $0
	p = Pe.new
	p.start
end
