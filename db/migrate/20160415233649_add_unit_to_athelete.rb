class AddUnitToAthelete < ActiveRecord::Migration
  def change
	add_column :atheletes, :unit_id, :integer
  end
end
