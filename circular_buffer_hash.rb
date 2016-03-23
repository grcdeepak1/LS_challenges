#Data structure - hash
# {1=>"", 2=>"", 3=>""}

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(buffer_size)
    @buffer = {} ; (0..(buffer_size-1)).each { |n| @buffer[n] = "" }
    @buffer_size = buffer_size
    @read_index = 0
    @write_index= 0
  end

  def write(char)
    return if !char
    fail BufferFullException if full?
    @buffer[@write_index] = char
    incr_write_index
  end

  def write!(char)
    return if !char
    if !full?
      write(char)
    else
      @buffer[@write_index] = char
      incr_write_index
      incr_read_index
    end
  end

  def read
    fail BufferEmptyException if empty?
    op = @buffer[@read_index]
    @buffer[@read_index] = ""
    incr_read_index
    op
  end

  def clear
    @buffer = {} ; (0..@buffer_size-1).each { |n| @buffer[n] = "" }
    @read_index = 0
    @write_index= 0
  end

  private
  def empty?
    (0..@buffer_size-1).each do |n|
      return false if !(@buffer[n].empty?)
    end
    true
  end

  def full?
    (0..@buffer_size-1).each do |n|
      return false if @buffer[n].empty?
    end
    true
  end

  def incr_write_index
    @write_index = (@write_index + 1) % @buffer_size
  end

  def incr_read_index
    @read_index = (@read_index + 1) % @buffer_size
  end

  def decr_write_index
    @write_index = (@write_index - 1) % @buffer_size
  end

  def decr_read_index
    @read_index = (@read_index - 1) % @buffer_size
  end
end