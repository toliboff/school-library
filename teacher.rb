require_relative 'person'

class Teacher < Person
  def initialize(age, name = 'Unknown', specialization = '')
    super(name: name, age: age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
