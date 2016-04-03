class AddSwimItemIdToRecord < ActiveRecord::Migration
  def change
	add_column :records, :swim_item_id, :integer
  end
end
