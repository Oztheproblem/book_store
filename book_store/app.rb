require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store_test')

# Retrieve all books using the book repository.
repository = BookRepository.new(DatabaseConnection)
all_books = repository.all

all_books.each_with_index do |book, index|
  puts "#{index + 1} - #{book.title} - #{book.author_name}"
end