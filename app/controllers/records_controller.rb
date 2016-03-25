class RecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @records= current_user.records.all
  end
  def new
    @record = Record.new
  end
  def create
    @record = Record.new(record_params)

    @record.author = current_user
    @record.owner_id = current_user.id
    if @record.save
      redirect_to records_path
    else
      render :new
    end
  end

  def show

  end
  def record_params
    params.require(:record).permit(:owner_id, :program_id, :distance, :property_id, :minutes, :seconds, :month, :date)
  end
end
