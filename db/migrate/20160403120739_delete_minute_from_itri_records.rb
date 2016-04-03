class DeleteMinuteFromItriRecords < ActiveRecord::Migration
  def change
	remove_column :itri_records, :minute
  end
end
