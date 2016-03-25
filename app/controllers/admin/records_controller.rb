class Admin::RecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @records= Record.all
  end
  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.author = current_user
    if @record.save
      redirect_to admin_records_path
    else
      render :new
    end
  end

  private

  def record_params
    params.require(:record).permit(:program_id, :distance, :property_id, :minutes, :seconds, :owner_id)
  end
end
