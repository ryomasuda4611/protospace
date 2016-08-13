class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image, ImageUploader
  enum status: { main: 0, sub: 1}
end
