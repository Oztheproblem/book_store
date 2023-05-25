require_relative './book'
=begin
class BookRepository
  def all
    books = []
    sql = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|
      books = Book.new
      books.id = record['id']
      books.title = record['title']
      books.author_name = record['author_name']

      books << book
    end

    return books
  end
end
=end
class BookRepository
  def initialize(connection)
    @connection = connection
  end

  def all
    books = []
    what_i_want = 'SELECT id, title, author_name FROM books;'
    result = @connection.exec_params(what_i_want, [])
    
    result.each do |each_result_line|
      book_inst = Book.new

      book_inst.id =  each_result_line['id']
      book_inst.title = each_result_line['title']
      book_inst.author_name = each_result_line['author_name']

      books << book_inst
    end
    books
  end

end
