class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :color
      t.integer :price_cents
      t.integer :amount_available

      t.timestamps null: false
    end
  end
end
