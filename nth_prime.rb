class Prime
  include Math

  def self.nth(nth_number)
    fail ArgumentError if nth_number.zero?
    prime = nil
    nth_number.times { prime = find_next_prime(prime) }
    prime
  end

  private

  def prime?(num)
    (2..sqrt(num)).each { |i| return false if num % i == 0 }
    true
  end

  def find_next_prime(num)
    n = num ? num + 1 : 2
    n += 1 while !prime?(n)
    n
  end
end