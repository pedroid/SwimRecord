class Delete < ActiveRecord::Migration
  def change
	remove_column :itri_records, :property_id
  end
end
