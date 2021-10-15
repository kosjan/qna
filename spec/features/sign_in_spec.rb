require 'rails_helper'

feature 'User sign in', %q{
  In irder to be able to ask a questions and give an answer
  As an User
  I want to be able to sign in
} do
  given(:user) { create(:user) }
  scenario 'Registered user try to sign in' do
    sign_in(user)

    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq root_path
  end

  scenario 'Non-registered user trying to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@test.ru'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).to eq new_user_session_path
  end
end
