class RemoveBirthdayToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :birthday, :datetime
  end
end
