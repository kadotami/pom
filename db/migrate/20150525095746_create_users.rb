class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.float :height
      t.float :weight
      t.float :fat_rate

      t.timestamps null: false
    end
  end
end
