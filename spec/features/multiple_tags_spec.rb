require 'spec_helper'

feature 'adding new links' do
  scenario 'I can add multiple tags to a link and see them' do
    visit '/links/new'
    fill_in(:url, with: 'www.makersacademy.com')
    fill_in(:title, with: 'Makers Academy')
    fill_in(:tag, with: "Bootcamp, Ruby, London")
    click_button('Submit')
    within 'ul#links' do
      expect(page).to have_content 'Title: Makers Academy URL: www.makersacademy.com Tag: Bootcamp / Ruby / London'
    end
  end
end
