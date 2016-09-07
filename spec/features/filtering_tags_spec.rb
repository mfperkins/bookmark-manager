require 'spec_helper'

feature 'filtering tags' do
  scenario 'a user can filter links using tags' do
    create_link('www.makersacademy.com','Makers Academy', 'education')
    create_link('http://www.shooter-bubble.com/','Bubble Shooter', 'bubbles')

    visit '/tags/bubbles'

    expect(page).to have_content('Bubble Shooter')
  end
end
