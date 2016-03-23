# - Given the range (min and max)
# - Report the largest and smallest (values and factors)

# LOOP i = min_factor to max_factor
# 	LOOP j = min_factor to max_factor
# 		arr << [i, j] if isPalindrome?(i*j)
# 	END
# END
require 'pry'


class Palindrome
	attr_accessor :value, :factors
	def initialize(args)
		@value = args[:value]
		@factors = [args[:factor]]
	end

	def <<(arr)
		@factors << arr
	end

end

class Palindromes
	attr_accessor :min_factor, :max_factor
	def initialize(args)
	  @min_factor = args[:min_factor] || 1
		@max_factor = args[:max_factor]
		@smallest_palindrome = nil
		@largest_palindrome  = nil
	end

	def largest
		@largest_palindrome
	end

	def smallest
		@smallest_palindrome
	end

	def generate
		smallest_pal = nil
		largest_pal = nil
		(@min_factor..@max_factor).each do |i|
			(i..@max_factor).each do |j|
				if isPalindrome?(i*j)
					if (!@smallest_palindrome ||
						 (@smallest_palindrome && @smallest_palindrome.value > i*j))
						smallest_pal = i*j
						@smallest_palindrome = Palindrome.new(value: smallest_pal, factor: [i, j].sort)
					elsif smallest_pal == i*j
						@smallest_palindrome << [i,j].sort
					end
					if (!@largest_palindrome ||
						 (@largest_palindrome && @largest_palindrome.value < i*j))
						largest_pal = i*j
						@largest_palindrome = Palindrome.new(value: largest_pal, factor: [i, j].sort)
					elsif largest_pal == i*j
						@largest_palindrome << [i, j].sort
				  end
				end
			end
		end
	end

	def generate_smallest_palindrome
		smallest_pal = nil
		(@min_factor..@max_factor).each do |i|
			(i..@max_factor).each do |j|
				if isPalindrome?(i*j)
					if (!@smallest_palindrome ||
						 (@smallest_palindrome && @smallest_palindrome.value > i*j))
						smallest_pal = i*j
						@smallest_palindrome = Palindrome.new(value: smallest_pal, factor: [i, j].sort)
					elsif smallest_pal == i*j
						@smallest_palindrome << [i,j].sort
					end
				end
			end
		end
	end

	def generate_largest_palindrome
		largest_pal = nil
		(@max_factor.downto(@min_factor)).each do |i|
			(i.downto(@min_factor)).each do |j|
				if isPalindrome?(i*j)
					if (!@largest_palindrome ||
						 (@largest_palindrome && @largest_palindrome.value < i*j))
						largest_pal = i*j
						@largest_palindrome = Palindrome.new(value: largest_pal, factor: [i, j].sort)
					elsif largest_pal == i*j
						@largest_palindrome << [i, j].sort
				  end
				end
			end
		end
	end

private
	def isPalindrome?(num)
		num.to_s == num.to_s.reverse
	end
end
