class Creditcard 
	attr_accessor :number

	def initialize(number='')
		@number = number.gsub(/\s+/,"").strip
	end
	
	def valid?
		@number.chars.to_a.reverse.each_with_index.inject(0) do |sum, (dig,i)|
			dig = dig.to_i		
			dig *=2 if(i%2==1)
			dig -= 9 if(dig > 9)
			sum += dig
		end % 10 == 0
	end

	def type
		return :AMEX 	 if amex?
		return :VISA 	 if visa?
		return :MasterCard 	 if master?
		return :Discover if discover?
		return :Unknown
	end

	private 
		def amex?
			@number =~ /^3(4|7)\d{13}$/
		end
		
		def visa?
			@number =~ /^4(\d{12}|\d{15})$/
		end
		
		def master?
			@number =~ /^5[1-5]\d{14}$/
		end

		def discover?
			@number =~ /^(6011)\d{12}$/
		end
end