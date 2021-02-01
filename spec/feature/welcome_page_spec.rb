feature 'welcome page' do
  scenario 'shows a welcome message on the homepage' do
    visit('/')
    expect(page).to have_content("Hello world!")
  end
end
