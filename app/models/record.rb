class Record < ActiveRecord::Base
	belongs_to :author, class_name: "User", foreign_key: :user_id
	belongs_to :swim_item, class_name:"SwimItem"
  belongs_to :swim_distance, class_name:"SwimDistance", foreign_key: :distance_id
	belongs_to :contest, class_name:"Contest"
  require 'csv'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      record_hash = row.to_hash # exclude the price field
      record = Record.where(id: record_hash["id"])

      if record.count == 1
        record.first.update_attributes(record_hash)
      else
        Record.create!(record_hash)
      end # end if !record.nil?
    end # end CSV.foreach
  end # end self.import(file)

end
