feature 'Viewing listings' do
  scenario 'A user wants to view listings' do
    DatabaseConnection.query("INSERT INTO listings (name, free_date, price) VALUES ('Oscar''s Parisian Flat', 'June 1, 2021', 400);")
    DatabaseConnection.query("INSERT INTO listings (name, free_date, price) VALUES ('Tom''s Santiago Palace', 'July 1, 2021', 200);")
    DatabaseConnection.query("INSERT INTO listings (name, free_date, price) VALUES ('Jack''s Beach Shack', 'August 1, 2021', 5);")

    visit '/listings'
    expect(page).to have_content "Oscar's Parisian Flat, 2021-06-01, £400/night"
    expect(page).to have_content "Tom's Santiago Palace, 2021-07-01, £200/night"
    expect(page).to have_content "Jack's Beach Shack, 2021-08-01, £5/night"
  end
end
