def sign_up
  visit '/signup'
  fill_in(:name, with: 'Frank Sinatra')
  fill_in(:email, with: 'FS@example.com')
  fill_in(:password, with: "Foobar")
  fill_in(:password_confirmation, with: "Foobar")
  click_button('Sign Up')
end

def failing_sign_up
  visit '/signup'
  fill_in(:name, with: 'Frank Sinatra')
  fill_in(:email, with: 'FS@example.com')
  fill_in(:password, with: "Foobar")
  fill_in(:password_confirmation, with: "Monkey")
  click_button('Sign Up')
end
