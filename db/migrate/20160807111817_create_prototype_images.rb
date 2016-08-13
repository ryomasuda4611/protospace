class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.references :prototype, index: true, foreign_key: true
      t.timestamps
    end
  end
end
