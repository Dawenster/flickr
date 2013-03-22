class Photo < ActiveRecord::Base
  mount_uploader :image, PicUploader
  belongs_to :album
end
