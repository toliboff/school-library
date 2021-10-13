require_relative 'classroom'
require_relative 'actions'

class Library
  include Actions
  attr_accessor :books, :persons, :rentals, :classrooms

  def initialize
    @books = []
    @persons = []
    @rentals = []
    @classrooms = []
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def start_app
    choice = show_menu
    choice = show_menu while choice < 1 || choice > 7

    case choice
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts 'Thank you for using this app!'
      save_data
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def show_menu
    options = [
      '1 - list all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - exit'
    ]

    puts 'Please choose an option by entering a number: ', options
    gets.chomp.to_i
  end

  def save_data
    File.open('books.json', 'w') { |f| f.write JSON.generate(@books) }
  end
  
  def get_books
    file = 'books.json'
  
    if File.exist? file
        data = JSON.parse(File.read(file), create_additions: true)
        data.each do |book|
          @books.push(Book.new(book['title'], book['author']))
        end
      else
      []
    end
  end
end



def main
 
  puts 'Welcome to School Library App!'

  library = Library.new
  library.get_books
  library.start_app
end


main
