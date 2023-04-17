require_relative 'decorator'

# here is the top level documentation
class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end
