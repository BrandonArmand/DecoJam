class Post < ApplicationRecord
  belongs_to :user
  belongs_to :task
  mount_uploader :image, ArtUploader
end
