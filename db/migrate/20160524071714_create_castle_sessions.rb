class CreateCastleSessions < ActiveRecord::Migration
  def change
    create_table :castle_sessions do |t|
      t.string :session_id
      t.string :device_id
      t.integer :status , default: 0

      t.timestamps null: false
    end
  end
end
