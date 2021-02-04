feature 'Booking a listing' do
  scenario 'it allows you to book the property' do

    DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Oscars Parisian Flat', 'June 1, 2021');")
    visit('/listings')
    click_button('Book')
    expect(page).to have_content 'Your booking was confirmed!' 
  end
end
