require 'spec_helper'

feature 'creating links' do
  scenario 'a user adds a link' do
    visit '/links/new'

    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('title', with: 'Makers Academy')

    click_button('Add Link')


    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
