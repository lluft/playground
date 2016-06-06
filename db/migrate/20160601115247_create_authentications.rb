class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.belongs_to :user, null: false, index: true
      t.string :castle_authentication_id, null: false
      t.string :session_id, null: false
      t.timestamps null: false
    end
  end
end
