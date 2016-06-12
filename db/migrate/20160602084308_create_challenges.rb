class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.belongs_to :authentication, null: false, index: true
      t.string :token
      t.boolean :confirmed, default: false
      t.timestamps null: false
    end
  end
end
