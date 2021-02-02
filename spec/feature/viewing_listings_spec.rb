feature 'Viewing listings' do
  scenario 'A user wants to view listings' do
    DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Oscar''s Parisian Flat', 'June 1, 2021');")
    DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Tom''s Santiago Palace', 'July 1, 2021');")
    DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Jack''s Beach Shack', 'August 1, 2021');")

    visit '/listings'
    expect(page).to have_content "Oscar's Parisian Flat"
    expect(page).to have_content "Tom's Santiago Palace"
    expect(page).to have_content "Jack's Beach Shack"
  end
end
