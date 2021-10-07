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
    puts 2
  elsif choice == 3 
    puts 3
  elsif choice == 4 
    create_book()  
  elsif choice == 5 
    puts 5
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
    '6 - List all rentals for a given id',
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
end

def main
  
  puts 'Welcome to School Library App!'
  puts 
  library = Library.new()
  library.start_app()
end

main()