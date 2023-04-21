require './student'
require './classroom'

geography = Classroom.new('Physics')

describe Student do
  context 'Testing the Student Class' do
    it 'The add_student method should add the current student to classroom' do
      student = Student.new(21, 'Joe', true)
      student.add_classroom(geography)
      expect(student.classroom).to eq geography
    end

    it 'The play_hooky method should return ¯(ツ)/¯' do
      student = Student.new(21, 'Joe', true)
      expect(student.play_hooky).to eq '¯(ツ)/¯'
    end
  end
end
