require 'json'
require 'pry'

class Database
  def self.save(books, people, rentals)
    save_books(books)
    save_people(people)
    save_rentals(rentals)
  end

  def self.save_books(books)
    return if books.nil?

    booksdata = './datas/books.json'
    records = read_existing_data(booksdata)

    books.each do |book|
      next if records.any? { |r| r['title'] == book.title && r['author'] == book.author && r['id'] == book.id }

      records << { title: book.title, author: book.author, id: book.id }
    end

    File.write(booksdata, JSON.generate(records))
  end

  def self.save_people(people)
    return if people.nil?

    peopledata = './datas/people.json'
    records = read_existing_data(peopledata)

    people.each do |person|
      next if records.any? { |r| r['id'] == person.id && r['name'] == person.name }

      records << { class: person.class, name: person.name, id: person.id, age: person.age,
                   parent_permission: person.can_use_services? }
    end
    File.write(peopledata, JSON.generate(records))
  end

  def self.save_rentals(rentals)
    return if rentals.nil?

    rentalsdata = './datas/rentals.json'
    records = read_existing_data(rentalsdata)

    rentals.each do |rental|
      next if records.any? do |r|
                r['person_id'] == rental.person.id && r['book_id'] == rental.book.id && r['date'] == rental.date
              end

      records << { date: rental.date, book_id: rental.book.id, person_id: rental.person.id }
    end

    File.write(rentalsdata, JSON.generate(records))
  end

  def self.read_existing_data(data)
    return [] unless File.exist?(data) && !File.empty?(data)

    JSON.parse(File.read(data))
  end
end