load 'creditcard.rb'

class Processor
	
	def self.readFile filename
		unless FileTest::exist?(filename)	
			puts "Cannot found the file." 
			return
		end
		@ccards = Array.new
		
		File.open(filename, "r") do |io| 
			while line = io.gets
				@ccards.push(Creditcard.new line)		
			end
		end

		self.output
	end	

	private 
		def self.output
			@ccards.each do |ccard|
				if ccard.valid?
					valid = "valid"
				else
					valid = "invalid"
				end
				puts "#{ccard.type}: #{ccard.number}\t(#{valid})"
			end		
		end
end





