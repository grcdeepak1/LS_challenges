class Matrix
  attr_reader :rows, :columns

  def initialize(str)
    @matrix = str.split("\n").map { |r| r.split(" ") }
    @rows = @matrix.each { |r| r.collect!(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    row_max = row_max_points
    col_min = col_min_points
    row_max & col_min
  end

  private

  def row_max_points
    row_max = []
    rows.each_with_index do |row, row_idx|
      find_max_indices(row).each { |col_idx| row_max << [row_idx, col_idx] }
    end
    row_max
  end

  def col_min_points
    col_min = []
    columns.each_with_index do |col, col_idx|
      find_min_indices(col).each { |row_idx| col_min << [row_idx, col_idx] }
    end
    col_min
  end

  def find_max_indices(arr)
    arr.each_index.select { |i| arr[i] == arr.max }
  end

  def find_min_indices(arr)
    arr.each_index.select { |i| arr[i] == arr.min }
  end
end
