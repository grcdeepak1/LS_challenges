#Data structure - Array
# [1][2][3][][][][]

class CircularBuffer

  def initialize(buffer_size)
    @buffer = []
    @buffer_size = buffer_size
  end

  def write(char)
    return if !char
    fail BufferFullException if full?
    @buffer << char
  end

  def write!(char)
    return if !char
    if !full?
      write(char)
    else
      @buffer.shift
      @buffer << char
    end
  end

  def read
    fail BufferEmptyException if empty?
    @buffer.shift
  end

  def clear
    @buffer = []
  end

  private
  def empty?
    @buffer.empty?
  end

  def full?
    @buffer.size == @buffer_size
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end