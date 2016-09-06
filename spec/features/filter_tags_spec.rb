require 'spec_helper'

feature 'filtering tags' do
  scenario 'filtering for bubbles tags' do
    visit '/links/new'
    fill_in(:url, with: 'www.bubbleslaundry.com')
    fill_in(:title, with: 'Bubbles')
    fill_in(:tag, with: "Bubbles")
    click_button('Submit')

    visit '/links/new'
    fill_in(:url, with: 'www.makersacademy.com')
    fill_in(:title, with: 'Makers Academy')
    fill_in(:tag, with: "Bootcamp")
    click_button('Submit')

    visit ('/tags/bubbles')
    within 'ul#links' do
      expect(page).to have_content 'Title: Bubbles URL: www.bubbleslaundry.com Tag: Bubbles'
      expect(page).not_to have_content 'Title: Makers Academy URL: www.makersacademy.com Tag: Bootcamp'
    end
  end
end
