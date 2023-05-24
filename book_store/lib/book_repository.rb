class BookRepository

    # Selecting all records
    # No arguments
    def all
      # Executes the SQL query:
      # SELECT id, name, author FROM Book
      ;
  
      # Returns an array of Book objects.
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
      # SELECT id, name, author FROM Book
       WHERE id = $1;
  
      # Returns a single Book object.
    end
end    