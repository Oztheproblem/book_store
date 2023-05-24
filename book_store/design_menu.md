# Book Store Model and Repository Classes Design Recipe
## 1. Design and create the Table
If the table is already created in the database, you can skip this step.

## 2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

# -- # EXAMPLE
-- (file: spec/Book_seeds.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

# TRUNCATE TABLE Book
 RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO Book (title, author) VALUES ('Nineteen Eighty-Four', 'George Orwell');
INSERT INTO Book (title, author) VALUES ('Mrs Dalloway', 'Virginia Woolf');  

1 -  - 
2 -  - 
psql -h 127.0.0.1 book_store_test < Book_seeds.sql
## 3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE



# Model class
# (in lib/Book.rb)
class Book
end

# Repository class
# (in lib/Book_repository.rb)
class BookRepository
end
## 4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: Book


# Model class
# (in lib/Book.rb)

class Book
  # Replace the attributes by your own columns.
  attr_accessor :id, :title, :author
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# Book = Book.new
# Book.name = 'Nineteen Eighty-Four'
# Book.name
You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

## 5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: Book


# Repository class
# (in lib/Book_repository.rb)

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

  # Add more methods below for each operation you'd like to implement.

  # def create(Book)
  # end

  # def update(Book)
  # end

  # def delete(Book)
  # end
end
## 6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all Book


repo = BookRepository.new

Books = repo.all
Books.length # =>  2
Books.id # =>  1
Books.first.title # =>  'Nineteen Eighty-Four'
Books.first.author # => 'George Orwell
Book

Books.id # =>  2
Books.first.title # =>  'Mrs Dalloway'
Books.first.author # => 'Virginia Woolf'
Book
# 2
# Get a single Book

repo = BookRepository.new

Book = repo.find(1)
Books.length # =>  2
Books.id # =>  1
Books.first.title # =>  'Nineteen Eighty-Four'
Books.first.author # => 'George Orwell
Book

# Add more examples for each method
Encode this example as a test.

## 7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/Book_repository_spec.rb

def reset_Books_table
  seed_sql = File.read('spec/seeds_Books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'Book
  ' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_Books_table
  end

  # (your tests will go here).
end
## 8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour. 