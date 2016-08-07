class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.references :prototype
      t.timestamps
    end
  end
end
