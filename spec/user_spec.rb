require './app/models/user'

describe User do

  let!(:user) do
    User.create(email: 'test@test.com', password: "password123", password_confirmation: "password123")
  end

  describe "#login" do

    it 'should return the user if the password hashes match' do
      logged_user = User.authenticate(user.email, user.password)
      expect(logged_user).to eq user
    end

    it 'should return an error message if the password hashes do not match' do
      logged_user = User.authenticate(user.email, 'dummy password')
      expect(logged_user).to be_nil
    end

  end


end
