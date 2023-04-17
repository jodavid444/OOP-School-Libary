# here is the top level documentation

class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student) unless @students.include?(student)
    student.classroom = self
  end

  attr_accessor :label
  attr_reader :students
end
