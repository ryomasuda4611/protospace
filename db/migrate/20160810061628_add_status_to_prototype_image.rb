class AddStatusToPrototypeImage < ActiveRecord::Migration
  def change
    add_column :prototype_images, :status, :integer
  end
end
