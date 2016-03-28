class CreateItriRecords < ActiveRecord::Migration
  def change
    create_table :itri_records do |t|
      t.integer :program_id
      t.integer :distance_id
      t.integer :property_id
      t.integer :minutes
      t.integer :seconds
      t.integer :owner_id
      t.integer :year

      t.timestamps null: false
    end
  end
end
