class AddYearToRecord < ActiveRecord::Migration
  def change
	add_column :records, :year, :integer
  end
end
