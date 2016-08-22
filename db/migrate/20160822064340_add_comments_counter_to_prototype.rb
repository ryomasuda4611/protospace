class AddCommentsCounterToPrototype < ActiveRecord::Migration
  def change
    add_column :prototypes, :comments_counter, :integer, dafault: 0
  end
end
