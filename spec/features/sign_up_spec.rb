require 'spec_helper'

feature 'New User Signup' do
  scenario 'User Registers' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Frank Sinatra')
    expect(User.first.email).to eq('FS@example.com')
  end
end
