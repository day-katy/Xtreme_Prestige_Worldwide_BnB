require 'users.rb'

describe Users do
  xit 'allows you to make an account and sign in' do
    test_user = Users.new(id: 1, email: 'test@email.com', password: 'password', name: 'Jack')
    expect(test_user.id).to eq 1
    expect(test_user.email).to eq 'test@email.com'
    expect(test_user.password).to eq 'password'
    expect(test_user.name).to eq 'Jack'
  end

  xit 'can recall the user from the database' do
    Users.create(email: 'test@email.com', password: 'password', name: 'Charlie')
    expect(Users.all_users[0].name).to eq 'Charlie'
    expect(Users.all_users[0].email).to eq 'test@email.com'
    expect(Users.all_users[0].password).to eq 'password'
  end
  xit 'signs in user' do
  auth = Users.sign_in(email: 'email@email.com', password: 'password')
  user = Users.create(email: 'email@email.com', password: 'password', name: 'Jack')
    expect(auth.id).to eq user.id
  end
end
#  need to sort this out.
