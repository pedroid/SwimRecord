class SwimDistance < ActiveRecord::Base
  has_many :itri_record, class_name: "ItriRecord",foreign_key: :distance_id
end
