class CreateSwimItems < ActiveRecord::Migration
  def change
    create_table :swim_items do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
