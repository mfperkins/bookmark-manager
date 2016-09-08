require 'spec_helper'

feature "sign in" do

  before (:each) do
    sign_up
    Capybara.reset_sessions!
  end

  scenario "a user should be able to sign in" do
    sign_in
    expect(page).to have_content("Welcome, James")
  end
end
