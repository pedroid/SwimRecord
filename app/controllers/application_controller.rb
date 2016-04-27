class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end

 def admin_required
	if !current_user.admin?
		redirect_to "/"
	end
 end


 def get_record_owner_collection
  record_owner_collection = [["test",1],["test2",2]]

   return record_owner_collection
 end

 def get_swim_item_collection2
   swim_item_collection = []
   i=1
   @swim_items.each do |swim_item|
     swim_item_collection << [swim_item.name,i]
     i = i+1
   end
   return swim_item_collection
 end


 def get_distance_collection
   distance_collection = []
   i=1
   @swim_distances.each do |swim_distance|
     distance_collection << [swim_distance.distance,i]
     i = i+1
   end
   return distance_collection
 end

 def get_contest_collection
   contest_collection = []
   i=1
   @contests.each do |contest|
     contest_collection << [contest.name,i]
     i = i+1
   end
   return contest_collection
 end


end
