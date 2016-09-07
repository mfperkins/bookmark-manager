def create_link(url, title, education)

  visit '/links/new'

  fill_in('url', with: url.to_s)
  fill_in('title', with: title.to_s)
  fill_in('tag', with: education.to_s)

  click_button('Add Link')

end
