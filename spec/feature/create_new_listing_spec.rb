feature "Create listing" do
  scenario "I want to get to the create listing page" do
    visit('/')
    user_sign_in
    click_button("Add listing")
    expect(page).to have_content("Please fill out the below information to add a listing")
  end

  scenario "I want to create my listing" do
    # user_sign_in
    visit('/listing/new')
    fill_in('name', with: "Kilimanjaro Cabin")
    fill_in('free_date', with: '2021-09-22')
    fill_in('price', with: 400)
    fill_in('description', with: 'A cabin in the woods with no one for miles')
    fill_in('image', with: '-')
    click_button("Create listing")
    expect(page).to have_content("Your listing Kilimanjaro Cabin was successfully created!")
  end

  scenario "I want to see my listing on the listings page" do
    visit('/listing/new')
    fill_in('name', with: "Kilimanjaro Cabin")
    fill_in('free_date', with: '2021-09-22')
    fill_in('price', with: 400)
    fill_in('description', with: 'A cabin in the woods with no one for miles')
    click_button("Create listing")
    click_button("Back to listings")

    expect(page).to have_content "Kilimanjaro"
  end

  scenario "I want to see my description of my listing" do
    visit('/listing/new')
    fill_in('name', with: "Kilimanjaro Cabin")
    fill_in('free_date', with: '2021-09-22')
    fill_in('price', with: 400)
    fill_in('description', with: 'A cabin in the woods with no one for miles')
    fill_in('image', with: '-')
    click_button("Create listing")
  end
end
