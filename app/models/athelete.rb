class Athelete < ActiveRecord::Base
	has_many :itri_records, class_name: "ItriRecord",foreign_key: :owner_id
	belongs_to :unit
end
