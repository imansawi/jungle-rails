require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before (:each) do
  @user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: 'test@test.com',
    password: '123456789',
    password_confirmation: '123456789'
  )
  end

  scenario 'user login' do
    visit root_path
    click_link 'Login'
    sleep(0.2)
    #puts page.html
    save_screenshot('login_form.png')
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456789'
    save_screenshot('login_form2.png')
    click_button 'Login'
    #sleep(1)
    save_screenshot('login_form3.png')
    expect(page).to have_text 'test@test.com'
    expect(page).to have_link 'Logout' 
  end 
end