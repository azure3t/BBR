class DropSecreteLikestables < ActiveRecord::Migration
  def change
    drop_table :likes
    drop_table :secrets
  end
end
