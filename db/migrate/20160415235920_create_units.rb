class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
