class AddContestAndSexToItriRecords < ActiveRecord::Migration
  def change
	add_column :itri_records, :contest_id, :integer
	add_column :itri_records, :sex, :boolean
  end
end
