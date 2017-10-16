class Test2
	attr_reader :quantity, :rate, :raw

	

    def initialize(attrs = {})
      @quantity    = attrs['Quantity']
      @rate        = attrs['Rate']
      #@raw         = attrs
    end


    def self.get
    	@map = check.map{|data| new(data) }
    end

    def self.sum
    	result_qtd = 0.0
    	result_rate = 0.0
    	get.map.each {|x| 
    		result_qtd += x.quantity
    		result_rate += x.rate }
    	puts result_qtd
    	puts result_rate
    end


	private
	def self.check
		json = Bittrex::Order.orderbook("BTC-MONA","sell",0)
		return json
	end


end

