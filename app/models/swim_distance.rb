class SwimDistance < ActiveRecord::Base
  has_many :itri_records, class_name: "ItriRecord",foreign_key: :distance_id
end
