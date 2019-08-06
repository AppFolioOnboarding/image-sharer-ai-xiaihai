class AddVisibleToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :visible, :integer, default: 1
  end
end
