class Album < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :photos

  mount_uploader :filename, ImageUploader
end
