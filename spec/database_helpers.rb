require 'pg'

def persisted_data(id:, table:)
  # table:users
  connection = PG.connect(dbname: 'xtreme_bnb_test')
  result = connection.query("SELECT * FROM #{table} WHERE user_id = #{id};")
  result.first
  # elsif table:listings
  #   connection = PG.connect(dbname: 'xtreme_bnb_test')
  #   result = connection.query("SELECT * FROM #{table} WHERE listing_id = #{id};")
  #   result.first
  # else table:
  #   connection = PG.connect(dbname: 'xtreme_bnb_test')
  #   result = connection.query("SELECT * FROM #{table} WHERE booking_id = #{id};")
  #   result.first
end
