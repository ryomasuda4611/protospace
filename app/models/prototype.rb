class Prototype < ActiveRecord::Base
  has_many :prototype_images
  belongs_to :user
end
