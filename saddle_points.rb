require 'pry'
class Matrix

  attr_reader :rows, :columns

  def initialize(str)
    @matrix = str.split("\n").map { |r| r.split(" ") }
    @rows = @matrix.each { |r| r.collect!(&:to_i) }
    @columns =  get_cols_from_rows(@rows)
  end

  def rows
    @rows
  end

  def columns
    @columns
  end

  def saddle_points
    row_max = row_max_points
    col_min = col_min_points
    saddle = row_max & col_min
  end

  private
  def row_max_points
    row_max = []
    rows.each_with_index do |row, row_idx|
      find_max_with_index(row).each { |n, col_idx| row_max << [row_idx, col_idx] }
    end
    row_max
  end

  def col_min_points
    col_min = []
    columns.each_with_index do |col, col_idx|
      find_min_with_index(col).each { |n, row_idx| col_min << [row_idx, col_idx] }
    end
    col_min
  end

  def find_max_with_index(arr)
    ret_arr = []
    arr.each_with_index do |num, i|
        if num == arr.max
          ret_arr << [num, i]
        end
    end
    ret_arr
  end

  def find_min_with_index(arr)
    ret_arr = []
    arr.each_with_index do |num, i|
        if num == arr.min
          ret_arr << [num, i]
        end
    end
    ret_arr
  end

  def get_cols_from_rows(rows)
    cols = []
    cols_size = rows[0].size
    (0..cols_size-1).each do |i|
      col = []
      rows.each { |row| col << row[i] }
      cols << col
    end
    cols
  end
end
