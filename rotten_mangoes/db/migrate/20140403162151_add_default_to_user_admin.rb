class AddDefaultToUserAdmin < ActiveRecord::Migration
  def change
    change_column :users, :admin, :admin, default: false
  end
end
