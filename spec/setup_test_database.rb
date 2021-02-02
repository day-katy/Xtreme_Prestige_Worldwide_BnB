require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'xtreme_bnb_test')
  connection.exec("TRUNCATE users;")
end
