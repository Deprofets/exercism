class School
  def initialize
    @students = Hash.new { |h, k| h[k] = [] }
  end

  def add(name, grade)
    @students[grade] << name
    @students[grade].sort!
  end

  def students(grade)
    @students[grade]
  end

  def students_by_grade
    @students.map { |k, v| { :grade => k, :students => v } }.sort_by { |pair| pair[:grade] }
  end
end
