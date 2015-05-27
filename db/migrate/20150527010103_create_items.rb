class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.boolean :completed
      t.datetime :expires_at
      
      t.timestamps null: false
    end
  end
end
