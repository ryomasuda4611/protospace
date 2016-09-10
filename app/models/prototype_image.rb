class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image, ImageUploader
  enum status: { main: 0, sub: 1}
  validates_presence_of :image, :status
end
