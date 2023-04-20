require './student'
require './classroom'

student = Student.new(21, 'Joe', true)

describe Classroom do
  context 'Testing Classroom Class' do
    it 'The add_stundent method should add student to classroom' do
      classroom = Classroom.new('Physics')
      classroom.add_student(student)
      expect(classroom.students.length).to eq 1
    end
  end
end