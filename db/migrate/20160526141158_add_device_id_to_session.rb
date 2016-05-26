class AddDeviceIdToSession < ActiveRecord::Migration
  def change
    add_reference :sessions, :device, index: true
    add_foreign_key :sessions, :devices
  end
end
