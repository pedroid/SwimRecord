class RenameDistanceToDistanceIdOfRecords < ActiveRecord::Migration
  def change
	rename_column :records, :distance, :distance_id
  end
end
