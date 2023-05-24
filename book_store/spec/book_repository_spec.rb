require 'book_repository'

RSpec.describe BookRepository do
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

        it 'return all books' do
        repo = BookRepository.new(DatabaseConnection)

        Books = repo.all
        expect(Books.length).to eq 2
        expect(Books.id).to eq 1
        expect(Books.first.title).to eq 'Nineteen Eighty-Four'
        expect(Books.first.author).to eq 'George Orwell'
        end 
    end
end

        

 #       Books.id # =>  2
  #      Books.first.title # =>  'Mrs Dalloway'
   #     Books.first.author # => 'Virginia Woolf'  
