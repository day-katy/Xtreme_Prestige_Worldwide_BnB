require 'pg'
require 'bcrypt'
require_relative './database_connection'

class Users
  attr_reader :id, :email, :name

  def initialize(id:, email:, name:)
    @id = id
    @email = email
    @name = name
  end

  def self.create(email:, password:, name:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password, name) VALUES('#{email}', '#{encrypted_password}', '#{name}') RETURNING id, email, name;")
  
    Users.new(
      id: result[0]['id'], 
      email: result[0]['email'], 
      name: result[0]['name']
      )
  end

  # def self.all_users
  #  result = DatabaseConnection.query("SELECT * FROM users;")

  #   result.map do |user|
  #     Users.new(id: user['id'], email: user['email'], password: user['password'], name: user['name'])
  #   end
  # end

  # def self.sign_in(email:, password:)
  #   result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}' and password = '#{password}' RETURNING id, email, password, name ;")

  #   Users.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'], name: result[0]['name'])
  # end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    Users.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

end
