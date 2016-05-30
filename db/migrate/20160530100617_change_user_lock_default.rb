class ChangeUserLockDefault < ActiveRecord::Migration
  def change
  change_column_default :users, :lock, false
  end
end
