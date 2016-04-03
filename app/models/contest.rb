class Contest < ActiveRecord::Base
  has_many :itri_record, class_name: "ItriRecord"
end
