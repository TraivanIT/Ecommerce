class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.float :product_price
      t.integer :moderator_id
      t.text :product_image

      t.timestamps
    end
  end
end
