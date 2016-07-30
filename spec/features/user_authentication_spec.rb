require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows a user to signup' do
    # Visit the home page
    visit root_path

    # Make sure there's a link with the text Signup
    expect(page).to have_link('Signup')

    # Click the link with the text Signup
    click_link 'Signup'

    # Fill in my first name
    fill_in 'First name', with: 'bob'

    # Fill in my last name
    fill_in 'Last name', with: 'smith'

    # ...
    fill_in 'Email', with: 'bob@smith.com'
    fill_in 'Password', with: 'sup3rs3krit'
    fill_in 'Password confirmation', with: 'sup3rs3krit'

    # Click a button that says Signup
    click_button 'Signup'

    # Make sure the page thanks me!
    expect(page).to have_text('Thank you for signing up Bob')

    # Make sure the page knows who is logged in
    expect(page).to have_text('Signed in as bob@smith.com')

  end

  scenario 'allows existing user to login' do
    user = FactoryGirl.create(:user)

    visit root_path

    expect(page).to have_link('Login')

    click_link('Login')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'

    expect(page).to have_text("Welcome back #{user.first_name.titleize}")

    # Make sure the page knows who is logged in
    expect(page).to have_text("Signed in as #{user.email}")
  end

  scenario 'disallows existing user to login with bad password' do
    user = FactoryGirl.create(:user)

    visit root_path

    expect(page).to have_link('Login')

    click_link('Login')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'NOT_YOUR_PASSWORD'

    click_button 'Login'

    expect(page).to have_text("Invalid email or password")
  end

  scenario 'allows logged in user to logout' do
    user = FactoryGirl.create(:user)

    visit root_path

    expect(page).to have_link('Login')

    click_link('Login')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'

    expect(page).to have_text("Welcome back #{user.first_name.titleize}")

    # Make sure the page knows who is logged in
    expect(page).to have_text("Signed in as #{user.email}")

    expect(page).to have_link('Logout')

    click_link('Logout')

    expect(page).to have_text("#{user.email} has been logged out")

    expect(page).to_not have_text("Welcome back #{user.first_name.titleize}")
    expect(page).to_not have_text("Signed in as #{user.email}")
  end
end
