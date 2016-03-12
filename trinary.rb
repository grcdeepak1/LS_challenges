class Trinary
	attr_accessor :tri_str

	def initialize(str)
		@tri_str = str.to_str
	end

	def to_decimal
		if self.valid?
			arr = tri_str.each_char.to_a.map { |n| n.to_i }
			ans = arr.reverse.each_with_index.map { |n,i| n*3**i }.reduce(:+)
		else
			return 0
		end
	end

	def valid?
		!!tri_str.match(/^[0-3]+$/)
	end
end