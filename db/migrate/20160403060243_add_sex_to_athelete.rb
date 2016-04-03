class AddSexToAthelete < ActiveRecord::Migration
  def change
	add_column :atheletes, :sex, :boolean
	remove_column :itri_records, :sex
  end
end
