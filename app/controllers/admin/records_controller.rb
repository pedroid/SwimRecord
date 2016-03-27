class Admin::RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
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

  def show
    if valid_page?
      render params[:id]
    else
      render file:"public/404.html", status: :not_found
    end
  end
  def import
    Record.import(params[:file])
    redirect_to admin_records_path
  end
  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/admin/records/#{params[:id]}.html.erb"))
  end

  def record_params
    params.require(:record).permit(:program_id, :distance, :property_id, :minutes, :seconds, :owner_id)
  end


end
