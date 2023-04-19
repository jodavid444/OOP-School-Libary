require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'loaddata'

class App
  def initialize
    @books = LoadData.load_books

    @people = LoadData.load_people

    @rentals = LoadData.load_rentals
  end

  def list_all_books
    if @books.empty?
      puts 'No books have yet been created!'
    else
      @books.each_with_index do |book, index|
        puts "#{index}. Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No person added to the system'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_all_people_with_index
    @people.each_with_index do |person, index|
      puts "#{index}. [#{person.class}] Name: #{person.name}, ID #{person.id}, Age: #{person.age}"
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Do this person have parental permission? [Y/N]: '
    permission = gets.chomp.downcase

    case permission
    when 'y' then parent_permission = true
    when 'n' then parent_permission = false
    end

    @people.push(Student.new('11', age, name, parent_permission: parent_permission))
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @people.push(Teacher.new(specialization, age, name))
  end

  def create_person
    print 'Choose options for creating a person: Student(1), Teacher(2)? [Input the number]: '
    case gets.chomp
    when '1'
      create_student

    when '2'
      create_teacher
    end

    puts 'Person Created Successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))

    puts 'Book Created Successfully'
  end

  def create_rental()
    puts 'Select a book from the list by number'
    list_all_books
    book_option = gets.chomp.to_i
    puts

    puts 'Select a person from the list by number (NOT ID!)'
    list_all_people_with_index
    person_option = gets.chomp.to_i
    puts

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @books[book_option], @people[person_option]))

    puts 'Rental Created Successfully'
  end

  def rentals_of_person()
    puts 'All people in the system'
    list_all_people
    print 'Id of the person: '
    id = gets.chomp.to_i
    person = @people.find { |p| p.id == id }

    if person
      @rentals.each do |rental|
        puts "Date #{rental.date}, Book: #{rental.book.title} Author: #{rental.book.author}" if rental.person.id == id
      end
    else
      puts 'No person matches the given ID!'
    end
  end
end