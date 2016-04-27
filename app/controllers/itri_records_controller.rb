class ItriRecordsController < ApplicationController
  def index
    @itri_records_male = ItriRecord.joins(:athelete).where(:atheletes=>{:sex=>true})
    @itri_records_female = ItriRecord.joins(:athelete).where(:atheletes=>{:sex=>false})
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
  def edit
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
    case params[:id]
    when "import" then
        render params[:id]
    when "overall" then
      @itri_records= ItriRecord.order("minutes ASC").order("seconds ASC")
        render params[:id]
    else
      @itri_record = ItriRecord.find(params[:id])
      @itri_records= ItriRecord.joins(:athelete).where(:atheletes=>{:sex=>@itri_record.athelete.sex}).where(swim_item:@itri_record.swim_item).where(swim_distance:@itri_record.swim_distance).order("updated_at DESC")
    end
  end
  def import
    ItriRecord.import(params[:file])
    redirect_to itri_records_path
  end

  def update
    @itri_record = ItriRecord.find(params[:id])
       if @itri_record.update(itri_record_params)
         redirect_to itri_records_path, notice: "修改成功"
       else
         render :edit
       end

  end

  def edit
    @itri_record = ItriRecord.find(params[:id])
    @swim_items = SwimItem.all
    @swim_distances = SwimDistance.all
    @atheletes = Athelete.all
    @contests = Contest.all
  end

  def destroy
    @itri_record = ItriRecord.find(params[:id])
    @itri_record.destroy
    redirect_to itri_records_path, alert:"record deleted"
  end

  private
  def itri_record_params
    params.require(:itri_record).permit(:owner_id, :swim_item_id, :distance_id, :contest_id, :minutes, :seconds, :year)
  end
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/itri_records/#{params[:id]}.html.erb"))
  end

end
