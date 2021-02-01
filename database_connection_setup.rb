require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('xtreme_bnb_test')
else
  DatabaseConnection.setup('xtreme_bnb')
end