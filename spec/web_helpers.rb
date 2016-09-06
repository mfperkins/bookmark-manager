def sign_up
  visit '/signup'
  fill_in(:name, with: 'Frank Sinatra')
  fill_in(:email, with: 'FS@example.com')
  fill_in(:password, with: "Foobar")
  click_button('Sign Up')
end
