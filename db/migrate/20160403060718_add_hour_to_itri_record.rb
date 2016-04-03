class AddHourToItriRecord < ActiveRecord::Migration
  def change
	add_column :itri_records, :minute, :integer
  end
end
