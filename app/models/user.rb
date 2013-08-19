class User < ActiveRecord::Base
  has_many :photos

  has_many :comments_about_photo, as: :commentable, class_name: "Comment"
  # has_many: comments_by_me, class_name: "Comment", foreign_key: "author_id"

  # add this for passwords and enable bcrypt-ruby in gemfile
  # fix this test later, take out validations: false - right now won't validate
  has_secure_password validations: false

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  validate :logged_in_user_matches_stripe_customer
  # validate :user_passwords_match, message: "Passwords do not match."

  # Custom validator
   def logged_in_user_matches_stripe_customer
      # ...
      # Must return true for validation to pass.
      # More details :http://edgeguides.rubyonrails.org/active_record_validations.html#performing-custom-validations

      true
   end

   def user_passwords_match
    if password === password_confirmation
      true
    else
      false
    end
   end

end
