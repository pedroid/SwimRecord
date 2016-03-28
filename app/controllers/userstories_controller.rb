class UserstoriesController < ApplicationController
	def index
		@userstories = Userstory.all
	end
	def new
		@userstory = Userstory.new
	end

	def create
		@userstory = current_user.userstories.create(userstory_params)
		@userstory.user = current_user
		if @userstory.save
			redirect_to userstories_path
		else
			render :new
		end
	end

	def edit
		@userstory = current_user.userstories.find(params[:id])
	end

	def update
		@userstory = current_user.userstories.find(params[:id])
		if @userstory.update(userstory_params)
			redirect_to userstories_path(@userstory)
		else
			render :edit
		end
	end

	def destroy
		@userstory = current_user.userstories.find(params[:id])
		@userstory.destroy
		redirect_to userstories_path
	end

	private

	def userstory_params
		params.require(:userstory).permit(:description)
	end
end
