require 'spec_helper'

feature 'adding tags to links' do

  scenario 'a user adds multiple tags to a link' do
    visit '/links/new'

    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('title', with: 'Makers Academy')

    fill_in('tag', with: 'education,work,code,london')
    click_button('Add Link')


    link = Link.first
    expect(link.tags.map(&:tag).join(' ')).to include('education work code london')
  end
end
