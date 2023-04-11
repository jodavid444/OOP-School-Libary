require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @cmd = {
      '1': 'List all books',
      '2': 'List all people',
      '3': 'Create a person',
      '4': 'Create a book',
      '5': 'Create a rental',
      '6': 'List all rentals for a given person id',
      '7': 'Exit'
    }

    @books = []

    @people = []
  end

  def display_cmd
    @cmd.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  def list_all_books
    if @books.empty?
      puts "No books have yet been created!"
    else
      @books.each_with_index do |book, index|
        puts "#{index}. Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def run
    puts 'Please choose an option to start'
    display_cmd
  end
end