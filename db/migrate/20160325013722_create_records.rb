class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :program_id
      t.integer :distance
      t.integer :property_id
      t.integer :minutes
      t.integer :seconds
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
