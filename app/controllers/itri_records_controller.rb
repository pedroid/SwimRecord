class ItriRecordsController < ApplicationController
  def index
    @itri_records = ItriRecord.all
  end
  def new
    @itri_record = ItriRecord.new
  end
  def create
    @itri_record = ItriRecord.new(itri_record_params)

    if @itri_record.save
      redirect_to itri_records_path
    else
      render :new
    end
  end
  private
  def itri_record_params
    params.require(:itri_record).permit(:owner_id, :program_id, :distance_id, :property_id, :minutes, :seconds, :month, :date, :year)
  end
end
