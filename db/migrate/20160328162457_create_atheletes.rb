class CreateAtheletes < ActiveRecord::Migration
  def change
    create_table :atheletes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
