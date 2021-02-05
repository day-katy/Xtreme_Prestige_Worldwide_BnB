feature 'Booking a listing' do
  scenario 'it allows you to book the property' do
    DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Oscars Parisian Flat', 'June 1, 2021');")
    user_sign_up
    visit('/listings')
    click_button('Book')
    expect(page).to have_content "Oscars Parisian Flat has been sent a booking request." 
  end
end
