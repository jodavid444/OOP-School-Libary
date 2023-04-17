require_relative 'nameable'

# here is the top level documentation
class Decorator < Nameable
  def initialize(nameable_obj)
    super()
    @nameable_obj = nameable_obj
  end

  def correct_name
    @nameable_obj.correct_name
  end
end
