require_relative 'book'
require_relative 'classroom'
# require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class Library
  attr_accessor :books, :persons, :rentals, :classrooms
  
  def initialize
    @books = []
    @persons = []
    @rentals = []
    @classrooms = []
  
  end

def start_app
  choice = show_menu()
  while choice < 1 || choice > 7
    choice = show_menu()
  end

  if choice==1
    list_all_books()
  elsif choice==2
    list_all_people
  elsif choice == 3 
    create_person() 
  elsif choice == 4 
    create_book()  
  elsif choice == 5 
    create_rental()
  elsif choice == 6 
    puts 6
  elsif choice == 7 
    puts 7
  end  
end

def show_menu
  options=[
    '1 - list all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all rentals for a given person id',
    '7 - exit'
  ]
  
  puts 'Please choose an option by entering a number: '
  puts options
  gets.chomp.to_i
end 

def list_all_books
  @books.each do |book| puts "Title: '#{book.title}', Author: #{book.author}" end
  start_app()
end

def list_all_people
  @persons.each do |person| puts "[Classname] Name: '#{person.name}', ID: #{person.id} , Age: #{person.age}" end
  start_app()
end

def create_person
   print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = 0

    while person_type!='2' && person_type!='1'
      person_type = gets.chomp
    end

    if person_type == '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp=='n'? false : true

      @persons.push(Student.new(age, name, permission))

    elsif person_type=='2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp

      @persons.push(Teacher.new(age, name, specialization))
  end
    puts 'Person created successfully'
    puts
    start_app()
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp

  @books.push(Book.new(title, author))
  puts 'Book created successfully'
  puts 
  start_app()
end

def create_rental
  puts 'Select a book from the following list by number'
  
  @books.each do |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" end
  selected_book = gets.chomp.to_i
  book=@books[selected_book]

  @persons.each do |person, index| puts "#{index}) [Classname] Name: '#{person.name}', ID: #{person.id} , Age: #{person.age}" end
  selected_person = gets.chomp.to_i
  person=@persons[selected_person]

  print 'Date: '
  date = gets.chomp
 
  @rentals.push(Rental.new(date, person, book))
  puts 'Rental created successfully'
  puts 
  start_app()
end
end

def main
  
  puts 'Welcome to School Library App!'
  puts 
  library = Library.new()
  library.start_app()
end

main()