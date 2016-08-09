class AddImageToPrototypeImage < ActiveRecord::Migration
  def change
    add_column :prototype_images, :image, :string
  end
end
