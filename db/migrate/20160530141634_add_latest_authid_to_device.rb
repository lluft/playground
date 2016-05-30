class AddLatestAuthidToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :latest_authentication_id, :string
  end
end
