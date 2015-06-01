class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account_id, presence: true, null: false
      t.string :name
      t.float :height
      t.float :weight
      t.float :fat_rate

      t.timestamps null: false
    end
    add_index :users, :account_id, :unique => true
  end
end
