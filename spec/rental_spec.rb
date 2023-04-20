require './rental'
require './student'
require './book'

student = Student.new(21, 'Joe', true)
book = Book.new('Gods are not to be blame', 'Rotimi')
rental = Rental.new('12/12/12', book, student)

describe Rental do
  context 'Testing Rental Class' do
    it 'The person should have rental added' do
      expect(student.rentals[0]).to eq rental
    end

    it 'The book should have a record of the rental instance' do
      expect(book.rentals[0]).to eq rental
    end
  end
end