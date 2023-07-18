class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|

      t.timestamps
      t.string :user,   null: false
      t.string :item,   null: false
    end
  end
end
