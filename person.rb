require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'

# here is the top level documentation
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id

  attr_accessor :name, :age, :rentals

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent(date, book)
    Rental.new(date, book, self)
  end
end
