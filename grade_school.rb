# Data structure
# students = { 1 => ['jim', 'jill'], 2 => ['aaron', 'ben']...}

class School
  def initialize
    @students = {}
  end

  def to_h
    sorted_hash = {}
    @students.keys.sort.each do |grade|
      sorted_hash[grade] = @students[grade].sort
    end
    sorted_hash
  end

  def add(name, grade)
    @students[grade] = [] if !@students[grade]
    @students[grade] << name
  end

  def grade(grade)
    @students[grade] ? @students[grade] : []
  end
end
