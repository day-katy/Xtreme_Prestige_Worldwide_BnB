feature 'authentication' do
  scenario 'a user can sign in' do
    Users.create(name: 'Katy', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button("Sign in")

    expect(page).to have_content "Welcome, Katy"
  end

  scenario 'a user sees an error if they get their email wrong' do
    Users.create(name: 'Katy', email: 'test@example', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, Katy'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario ' a user sees an error when they get their password wrong' do
    Users.create(name: 'Katy', email: 'test@emailaddress.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@emailaddress.com')
    fill_in(:password, with: 'incorrectpassword')
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome, Katy'
    expect(page).to have_content 'Please check your email or password.'
  end
end
