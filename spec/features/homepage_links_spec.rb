require 'spec_helper'

feature 'viewing links' do

  scenario 'I see links on homepage' do
    Link.create(url:'www.google.com', title: 'Google Homepage')
    visit '/links'
    within 'ul#links' do
    expect(page).to have_content 'Google Homepage'
    end
  end
end
