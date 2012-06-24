load 'processor.rb'
if(ARGV.count>0)
	Processor::readFile ARGV[0] 
else
	Processor::readFile "testfile.log" 
end