class AddSwimItemToItriRecords < ActiveRecord::Migration
  def change
	add_column :itri_records, :swim_item_id, :integer
  end
end
