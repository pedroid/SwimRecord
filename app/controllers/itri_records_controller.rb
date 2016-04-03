class ItriRecordsController < ApplicationController
  def index
    @itri_records = ItriRecord.all
    @swim_items = SwimItem.all
    @swim_distances = SwimDistance.all
  end
  def new
    @itri_record = ItriRecord.new
    @swim_items = SwimItem.all
    @swim_distances = SwimDistance.all
    @atheletes = Athelete.all
    @contests = Contest.all
  end
  def create
    @itri_record = ItriRecord.new(itri_record_params)
    if @itri_record.save
      redirect_to itri_records_path
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
    redirect_to itri_records_path
  end
  private
  def itri_record_params
    params.require(:itri_record).permit(:owner_id, :swim_item_id, :distance_id, :contest_id, :minutes, :seconds, :month, :date, :year)
  end

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/itri_records/#{params[:id]}.html.erb"))
  end
end
