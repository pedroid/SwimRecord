class DeleteProgramIdFromRecord < ActiveRecord::Migration
  def change
	remove_column :records, :program_id
  end
end
