require 'json'
require 'pry'

class LoadData
  def self.load_books
    booksdata = './datas/books.json'
    books = []
    if File.exist?(booksdata) && !File.empty?(booksdata)
      records = JSON.parse(File.read(booksdata))
      records.each do |record|
        book = Book.new(record['title'], record['author'])
        book.id = record['id']
        books << book
      end
    end
    books
  end

  def self.load_people
    peopledata = './datas/people.json'
    people = []

    if File.exist?(peopledata) && !File.empty?(peopledata)
      records = JSON.parse(File.read(peopledata))
      records.each do |record|
        person = if record['class'] == 'Student'
                   Student.new(record['parent_permission'], record['age'], record['name'])
                 else
                   Teacher.new('Math', record['age'], record['name'])
                 end
        person.id = record['id']
        people << person
      end
    end

    people
  end

  def self.load_rentals
    rentalsdata = './datas/rentals.json'
    rentals = []
    if File.exist?(rentalsdata) && !File.empty?(rentalsdata)
      records = JSON.parse(File.read(rentalsdata))
      people = load_people
      books = load_books
      records.each do |record|
        person = people.find { |item| item.id == record['person_id'] }
        book = books.find { |item| item.id == record['book_id'] }
        rental = Rental.new(record['date'], book, person)
        rentals << rental
      end
    end
    rentals
  end
end