# Data structure
# students = { 1 => ['jim', 'jill'], 2 => ['aaron', 'ben']...}

class School
	def initialize
		@students = {}
	end

	def to_h
		@students
	end
end