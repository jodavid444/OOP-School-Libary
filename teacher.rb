# OOP SCHOOL LIBRARY development
# frozen_string_literal: true

require_relative './person'

# here is the top level documentation
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
