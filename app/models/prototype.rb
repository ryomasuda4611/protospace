class Prototype < ActiveRecord::Base
  has_many :prototype_images
  belongs_to :user
  accepts_nested_attributes_for :prototype_images
  def main_image
    if prototype_images.main.present?
    prototype_images.main.first.image
  end
end
end
