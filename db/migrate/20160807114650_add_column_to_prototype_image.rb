class AddColumnToPrototypeImage < ActiveRecord::Migration
  def change
    add_column :prototype_images, :image_url , :text
    add_column :prototype_images, :role, :integer
  end
end
