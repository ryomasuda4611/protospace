class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image, ImageUploader
  enum role: { main:0 , sub:1}
end
