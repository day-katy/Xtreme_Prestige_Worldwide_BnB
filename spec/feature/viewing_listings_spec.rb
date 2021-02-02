feature 'Viewing listings' do
  scenario 'A user wants to view listings' do
    visit '/listings'
    expect(page).to have_content "Oscar's Parisian Flat"
    expect(page).to have_content "Tom's Santiago Palace"
    expect(page).to have_content "Jack's Beach Shack"
  end
end
