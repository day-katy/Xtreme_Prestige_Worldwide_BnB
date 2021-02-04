feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: "Katy")
    fill_in('email', with: "test@example.com")
    fill_in('password', with: "password123")
    click_button("Sign Up")
    #  save_and_open_page
    

    expect(page).to have_content "Welcome, Katy"
  end
end