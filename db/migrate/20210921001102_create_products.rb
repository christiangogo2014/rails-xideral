class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :remote_url
      t.string :stripe_price_id

      t.timestamps
    end
  end
end
