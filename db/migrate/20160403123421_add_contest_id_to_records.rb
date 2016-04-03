class AddContestIdToRecords < ActiveRecord::Migration
  def change
	add_column :records, :contest_id, :integer
  end
end
