require_relative 'app'
require_relative 'database'

class Main < App
  def initialize
    super()

    @cmd = {
      '1': 'List all books',
      '2': 'List all people',
      '3': 'Create a person',
      '4': 'Create a book',
      '5': 'Create a rental',
      '6': 'List all rentals for a given person id',
      '7': 'Exit'
    }
  end

  def choose_option(input)
    case input
    when '1' then list_all_books
    when '2' then list_all_people
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then rentals_of_person
    end
  end

  def exit_option
    input = gets.chomp
    if input == '7'
      Database.save(@books, @people, @rentals)
      exit
    else
      choose_option(input)
    end
  end

  def display_cmd
    @cmd.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  def run
    puts 'Please choose an option to start'
    display_cmd
    exit_option
  end
end

def command_call
  main = Main.new

  loop do
    main.run
    puts
  end
end

command_call