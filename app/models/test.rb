class Test

	$all = Bittrex::Summary.all



	def self.hello
		i = 0
		while (i < $all.length) do
			puts "#{$all[i].name} - Index #{i} "
			i += 1
		end
		test("name of caradecu")

	end


	def self.hello2
		hash = Hash.new

 		$all.each_with_index do |item,index|
			puts hash[item]

 			return
		end
	end

	def self.hello3
 		for x in 0..($all.length-1)
 			puts $all[x].name
 		end
	end


	def self.test(name)
		puts name
	end

	def self.do_something(data)
   			puts "Found! #{data}"
	end

	def self.find(coin)
		var = Bittrex::Summary.all
		var.collect.each_with_index {|key,index| (@aloha = index and puts key.last) if key.name == coin.upcase }
		puts @aloha
	end

	def self.callOtherClassMethod
		Test2.sum
	end

end