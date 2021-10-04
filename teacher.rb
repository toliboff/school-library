require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name: 'Unknown')
    super(name: name, age: age)
    @specialization = specialization
  end

end
