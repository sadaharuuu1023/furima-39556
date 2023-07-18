class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string :post_code,          null: false
      t.integer :prefecture_id,     null: false
      t.string :municipality,       null: false
      t.string :address,            null: false
      t.string :building,           null: false
      t.string :telephone_number,   null: false
      t.references :order,          null: false, foreign_key: true
    end
  end
end
