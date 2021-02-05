# require
def user_sign_up
  visit('/')
  click_button("Sign Up")
  fill_in("name", with: "Katy Day")
  fill_in("email", with: "test@example.com")
  fill_in("password", with: "password123")
  click_button("Sign Up")
end

def user_sign_in
  visit('/')
  click_button("Sign in")
  fill_in("email", with: "test@example.com")
  fill_in('password', with: 'password123')
  click_button("Sign in")
end
