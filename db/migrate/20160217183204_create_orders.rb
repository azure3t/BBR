class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :shoe, index: true

      t.timestamps
    end
  end
end
