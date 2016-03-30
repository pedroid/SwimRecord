class AddSwimDistanceToItriRecords < ActiveRecord::Migration
  def change
	add_column :itri_records, :swim_distance_id, :integer
  end
end
