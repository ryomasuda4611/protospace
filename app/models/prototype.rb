class Prototype < ActiveRecord::Base
  has_many :prototype_images
  belongs_to :user

  def main_image
    proprototype_images.main.image
end
