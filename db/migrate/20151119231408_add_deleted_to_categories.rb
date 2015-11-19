class AddDeletedToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :deleted, :boolean, default: false
  end
end
