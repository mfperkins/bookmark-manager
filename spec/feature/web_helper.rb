def sign_up(email: 'murtz@gmail.com',
            password: '1234',
            password_confirmation: '1234')
  visit '/users/new'
  fill_in('email', :with => email)
  fill_in('password', :with => password)
  fill_in('password_confirmation', :with => password_confirmation)
  click_button 'Sign up'
end
