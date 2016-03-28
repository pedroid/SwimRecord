class ItriRecord < ActiveRecord::Base
	belongs_to :athelete, class_name: "Athelete", foreign_key: :owner_id
	belongs_to :user, class_name: "User", foreign_key: :user_id
end
