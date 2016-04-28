class Contest < ActiveRecord::Base
  has_many :itri_records, class_name: "ItriRecord"
end
