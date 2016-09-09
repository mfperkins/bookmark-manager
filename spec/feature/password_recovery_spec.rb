feature 'password recovery' do

  scenario 'user can request ask for password recovery' do
    recover_password
    expect(page).to have_content "Check your email to recover your password"
  end

end
