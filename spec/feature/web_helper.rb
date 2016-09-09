def sign_up(email: 'murtz@gmail.com',
            password: '1234',
            password_confirmation: '1234')
  visit '/users/new'
  fill_in('email', :with => email)
  fill_in('password', :with => password)
  fill_in('password_confirmation', :with => password_confirmation)
  click_button 'Sign up'
end

def login
  visit '/users/login'
  fill_in('email', :with => 'murtz@gmail.com')
  fill_in('password', :with => '1234')
  click_button 'Log in'
end

def recover_password
  sign_up
  visit '/users/login'
  click_link("Recover password")
  fill_in('email', :with => "murtz@gmail.com")
  click_button("Submit")
end
