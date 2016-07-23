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
end
