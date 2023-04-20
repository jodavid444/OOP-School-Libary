require './book'
require './person'

person = Person.new(20, 'Joe')
describe Book do
  context 'Testing Book Class' do
    it 'the rent method should add the current book to rentals' do
      book = Book.new('Gods are not to be blame', 'Rotimi')
      book.rent('12-12-2012', person)
      expect(book.rentals.length).to eq 1
    end
  end
end