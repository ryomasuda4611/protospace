class Prototype < ActiveRecord::Base
  has_many :prototype_images, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :prototype_images, reject_if: proc { |attributes| attributes['image'].blank?}, allow_destroy: true
  acts_as_taggable
  validates_presence_of :title, :concept, :catch_copy


  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def main_image
    if prototype_images.main.present?
      prototype_images.main[0].image
    end
  end
end
