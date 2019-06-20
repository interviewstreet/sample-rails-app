class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.float :retail_price
      t.float :discounted_price
      t.boolean :availability

      t.timestamps
    end
  end
end
