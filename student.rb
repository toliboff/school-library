require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom
  def initialize(age, classroom, name= 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hoky
    '¯\\(ツ)/¯'
  end
end

student_1 = Student.new(1, 2, 'Karim')
python = Classroom.new('python')
python.add_student(student_1)

puts student_1.classroom.label

student_2=Student.new(15,0,'Zara')
student_2.classroom=python

puts student_2.classroom.label
puts python.students.map{|student| student.name}