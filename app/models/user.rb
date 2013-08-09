class User < ActiveRecord::Base

  # add this for passwords and enable bcrypt-ruby in gemfile
  has_secure_password

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
