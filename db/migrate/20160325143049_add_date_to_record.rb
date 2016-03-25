class AddDateToRecord < ActiveRecord::Migration
  def change
	add_column :records, :month, :integer
	add_column :records, :date, :integer
  end
end
