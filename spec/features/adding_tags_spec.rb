require 'spec_helper'

feature 'adding tags to links' do

  scenario 'a user adds a tag to a link' do
    visit '/links/new'

    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('title', with: 'Makers Academy')

    fill_in('tag', with: 'education')
    click_button('Add Link')


    link = Link.first
    expect(link.tags.map(&:tag)).to include('education')
  end
end
