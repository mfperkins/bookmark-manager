require 'spec_helper'

feature 'allow user to sign up' do
  scenario 'user signs up with email and password' do
    sign_up
    expect(page).to have_content ("Welcome, James")
  end

  scenario 'database user count increases by 1' do
    expect{sign_up}.to change{User.count}.by(1)
  end

  scenario 'user email is correct in DB' do
    sign_up
    expect(User.first.email).to eq 'James@James.com'
  end

end

  feature 'do NOT allow user to sign up' do
    scenario 'user enters mismatching password & confirmation' do
      expect{mismatching_password_sign_up}.to change{User.count}.by(0)
      expect(current_path).to eq('/sign_up')
      expect(page).to have_content('Password and confirmation Password don\'t match')
    end

    scenario 'user cannot sign up without an email address' do
      expect{missing_email_sign_up}.to_not change{User.count}
      expect(current_path).to eq('/sign_up')
    end

    scenario 'user cannot sign up with an invalid email address' do
      expect{invalid_email_sign_up}.to_not change{User.count}
      expect(current_path).to eq('/sign_up')
    end
end
