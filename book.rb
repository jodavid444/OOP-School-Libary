require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def rent(date, person)
    Rental.new(date, self, person)
  end
end