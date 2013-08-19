class Photo < ActiveRecord::Base
  # creates a constant for PRICE, so that you can change prices globally
  # see Photo::PRICE in photos controller

  PRICE = 1500

  scoped_search on: [:title, :description]

  belongs_to :user

  has_many :comments, as: :commentable

  mount_uploader :upload, UploadUploader

end

