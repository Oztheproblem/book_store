require_relative 'lib/database_connection'

DatabaseConnection.connect('book_store_test')

results = DatabaseConnection.exec_params(SELECT * FROM)