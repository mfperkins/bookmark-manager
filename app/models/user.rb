require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id,                Serial
  property :name,              String
  property :email,             String, :required => true, :unique => true
  property :password_digest,   BCryptHash

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(:password)
  end

end
