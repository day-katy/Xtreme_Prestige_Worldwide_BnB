feature 'Viewing listings' do
  scenario 'A user wants to view listings' do
    visit '/listings'
    expect(page).to have_content "Oscar's Parisian flat"
  end
end