 require 'users'
# require './lib/database_connection'
require 'database_helpers'
require 'bcrypt'

describe Users do

  describe ".create" do
   it 'allows you to make an account' do
    test_user = Users.create(name: 'Katy', email: 'test@example.com', password: 'password123')

    persisted_data = persisted_data(table: :users, id: test_user.id)

    expect(test_user).to be_a Users
    expect(test_user.email).to eq 'test@example.com'
    expect(test_user.name).to eq 'Katy'
  end

   it 'hashes the password using Bcrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    Users.create(name: 'Katy', email: 'test@example.com', password: 'password123')
  end

end
  # it 'can recall the user from the database' do
  #   Users.create(email: 'test@example.com', password: 'password', name: 'Charlie')
  #   expect(Users.all_users[0].name).to eq 'Charlie'
  #   expect(Users.all_users[0].email).to eq 'test@email.com'
  #   expect(Users.all_users[0].password).to eq 'password'
  # end

  # it 'signs in user' do
  # auth = Users.sign_in(email: 'email@example.com', password: 'password')
  # user = Users.create(email: 'email@example.com', password: 'password', name: 'Jack')
  #   expect(auth.id).to eq user.id
  # end

  describe '.find' do
    it 'finds a user by ID' do
      user = Users.create(name: 'Katy', email: 'test@example.com', password: 'password')
      result = Users.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.name).to eq user.name
    end

    it 'returns nil if there is no ID given' do
      expect(Users.find(id: nil)).to eq nil
    end

  end
end
#  need to sort this out.
