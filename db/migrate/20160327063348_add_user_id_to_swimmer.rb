class AddUserIdToSwimmer < ActiveRecord::Migration
  def change
	add_column :swimmers, :user_id, :integer
  end
end
