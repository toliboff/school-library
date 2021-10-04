require_relative 'person'

class Student < Person
  def initialize(age, classroom, name, parent_permission: false)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

end
