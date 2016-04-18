class Userstory < ActiveRecord::Base
	belongs_to :user, class_name: "User", foreign_key: :user_id
	def editable_by?(owner)
		owner && owner==user
	end
end
