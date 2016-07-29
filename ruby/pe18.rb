class Pe
	
	def start
		puts Time.new

		src = 
			              "75 " +
			             "95 64 " +
			            "17 47 82 " +
			           "18 35 87 10 " +
			          "20 04 82 47 65 " +
			         "19 01 23 75 03 34 " +
			        "88 02 77 73 07 63 67 " +
			       "99 65 04 28 06 16 70 92 " +
			      "41 41 26 56 83 40 80 70 33 " +
			     "41 48 72 33 47 32 37 16 94 29 " +
			    "53 71 44 65 25 43 91 52 97 51 14 " +
			   "70 11 33 28 77 73 17 78 39 68 17 57 " +
			  "91 71 52 38 17 14 91 43 58 50 27 29 48 " +
			 "63 66 04 68 89 53 67 30 73 16 69 87 40 31 " +
			"04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"		

		@arr = src.split(" ")	
		@rows = 15
		@depth = 2

		row = 1
		offset = 1
		sum = @arr[0].to_i
		lastval = sum
		puts row.to_s + ": " + lastval.to_s + " = " + sum.to_s
		while row < @rows do

			lrow, loffset, lval, rrow, roffset, rval = child_row_offset_val_tuples(row, offset) 

			lsum = lval + walk_from(lrow, loffset, @depth)
			rsum = rval + walk_from(rrow, roffset, @depth)

			puts "from " + lastval.to_s + " we can go to " + 
				lval.to_s + " (" + lsum.to_s + ") or " + 
				rval.to_s + " (" + rsum.to_s + ")" 

			if lsum >= rsum
				row = lrow
				offset = loffset
				sum += lval
				lastval = lval

				puts row.to_s + ": " + lval.to_s + " = " + sum.to_s
			else
				row = rrow
				offset = roffset
				sum += rval
				lastval = rval

				puts row.to_s + ": " + rval.to_s + " = " + sum.to_s
			end

		end

		puts Time.new
	end

	def walk_from(row, offset, steps)
		if row > @rows
			return 0
		end
		lrow, loffset, lval, rrow, roffset, rval = child_row_offset_val_tuples(row, offset) 
		if steps > 1
			if lval >= rval
				return lval + walk_from(lrow, loffset, steps - 1)
			else
				return rval + walk_from(rrow, roffset, steps - 1)
			end
		end
		if lval >= rval
			return lval
		else
			return rval
		end
	end

	def child_row_offset_val_tuples(row, offset)
		lrow = row + 1
		loffset = offset
		lval = @arr[get_index(lrow, loffset)].to_i
		rrow = row + 1
		roffset = offset + 1
		rval = @arr[get_index(rrow, roffset)].to_i
		return lrow, loffset, lval, rrow, roffset, rval
	end

	def get_index(row, offset)
		(1..row).reduce(:+) - row + offset - 1
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
