require_relative 'rental'

# here is the top level documentation
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent(date, person)
    Rental.new(date, self, person)
  end
end
