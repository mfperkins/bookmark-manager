require 'spec_helper'

feature 'New User Signup' do
  scenario 'successful new user registration' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Frank Sinatra')
    expect(User.first.email).to eq('FS@example.com')
  end

  scenario 'User Registers' do
    expect { failing_sign_up }.to change(User, :count).by(0)
    # expect(page).to have_content('Passwords do not match!')
  end

end
