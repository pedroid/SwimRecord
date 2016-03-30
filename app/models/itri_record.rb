class ItriRecord < ActiveRecord::Base
	belongs_to :athelete, class_name: "Athelete", foreign_key: :owner_id
	belongs_to :user, class_name: "User"
	has_one :swim_item, class_name:"SwimItem"
  has_one :swim_distance, class_name:"SwimDistance", foreign_key: :distance_id
	require 'csv'
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|

			record_hash = row.to_hash # exclude the price field
			record = ItriRecord.where(id: record_hash["id"])

			if record.count == 1
				record.first.update_attributes(record_hash)
			else
				ItriRecord.create!(record_hash)
			end # end if !record.nil?
		end # end CSV.foreach
	end # end self.import(file)
end
