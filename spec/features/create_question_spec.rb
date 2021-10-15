require 'rails_helper'

feature 'Create question', %q{
  In order to get an answer from users
  As an authoraized user
  I want to ask the question
} do
  given(:user) { create(:user) }

  scenario 'Authenticated user create the question' do
    sign_in(user)

    visit questions_path

    click_on 'Ask question'
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'Test body'
    click_on 'Create'

    expect(page).to have_content 'Your question successfully created.'
  end

  scenario 'Non-registered user trying to ask the question' do
    visit questions_path
    click_on 'Ask question'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
