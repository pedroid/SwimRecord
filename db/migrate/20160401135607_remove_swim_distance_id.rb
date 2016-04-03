class RemoveSwimDistanceId < ActiveRecord::Migration
  def change
	remove_column :itri_records, :swim_distance_id
  end
end
