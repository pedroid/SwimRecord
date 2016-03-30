class CreateSwimDistances < ActiveRecord::Migration
  def change
    create_table :swim_distances do |t|
      t.integer :distance

      t.timestamps null: false
    end
  end
end
