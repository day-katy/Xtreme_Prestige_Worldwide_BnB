require 'pg'

class Users
  attr_reader :id, :email, :password, :name

  def initialize(id:, email:, password:, name:)
    @id = id
    @email = email
    @password = password
    @name = name
  end

  def self.create(email:, password:, name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec("INSERT INTO users (email, password, name)
                              VALUES ('#{email}', '#{password}', '#{name}')
                              RETURNING id, email, password, name ;")

    Users.new(id: result[0]['id'],email: result[0]['email'],password: result[0]['password'],name: result[0]['name'])


  end

  def self.all_users
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec("SELECT * FROM users;")
    result.map do |user|
      Users.new(id: user['id'],email: user['email'],password: user['password'],name: user['name'])
    end
  end
end
