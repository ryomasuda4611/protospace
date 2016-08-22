class AddLikesCountToPrototypes < ActiveRecord::Migration
  def change
    add_column :prototypes, :likes_counter, :integer, default: 0
  end
end
