class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :password, length: {minimum:7}, on: :create
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, :password, presence: true, on: :create
  has_secure_password
  has_many :authentications, dependent: :destroy
  has_many :appointments, dependent: :destroy
  # dependent :destroy --> to destroy the appointments if the user account is deleted
  enum access_level: [:customer, :admin]
  include PgSearch
  pg_search_scope :search_user, :against => [:first_name]

 def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     first_name: auth_hash["info"]["first_name"],
     last_name: auth_hash["info"]["last_name"],
     email: auth_hash["info"]["email"],
     password: SecureRandom.hex(10)
   )
   user.authentications << authentication
   return user
 end

 # grab google to access google for user data
 def google_token
   x = self.authentications.find_by(provider: 'google_oauth2')
   return x.token unless x.nil?
 end

end