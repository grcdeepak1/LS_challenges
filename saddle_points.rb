class Matrix
  attr_reader :rows, :columns

  def initialize(str)
    @matrix = str.split("\n").map { |r| r.split(" ") }
    @rows = @matrix.each { |r| r.collect!(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    points_with_max_values & points_with_min_values
  end

  private

  def points_with_max_values
    points_with_max_values = []
    rows.each_with_index do |row, row_idx|
      find_max_indices(row).each { |col_idx| points_with_max_values << [row_idx, col_idx] }
    end
    points_with_max_values
  end

  def points_with_min_values
    points_with_min_values = []
    columns.each_with_index do |col, col_idx|
      find_min_indices(col).each { |row_idx| points_with_min_values << [row_idx, col_idx] }
    end
    points_with_min_values
  end

  def find_max_indices(arr)
    arr.each_index.select { |i| arr[i] == arr.max }
  end

  def find_min_indices(arr)
    arr.each_index.select { |i| arr[i] == arr.min }
  end
end
