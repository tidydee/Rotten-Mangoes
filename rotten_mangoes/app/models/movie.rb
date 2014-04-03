class Movie < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
end
