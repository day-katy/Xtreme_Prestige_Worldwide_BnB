require 'pg'
require 'bcrypt'
require_relative './database_connection'

class Users
  attr_reader :user_id, :email, :name

  def initialize(user_id:, email:, name:)
    @user_id = user_id
    @email = email
    @name = name
  end

  def self.create(email:, password:, name:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password, name) VALUES('#{email}', '#{encrypted_password}', '#{name}') RETURNING user_id, email, name;")

    Users.new(
      user_id: result[0]['user_id'],
      email: result[0]['email'],
      name: result[0]['name']
      )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}' ")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    Users.new(
      user_id: result[0]['user_id'],
      name: result[0]['name'],
      email: result[0]['email']
      )
  end

  def self.find(user_id:)
    return nil unless user_id
    result = DatabaseConnection.query("SELECT * FROM users WHERE user_id = #{user_id}")
    Users.new(user_id: result[0]['user_id'], email: result[0]['email'], name: result[0]['name'])
  end

end
