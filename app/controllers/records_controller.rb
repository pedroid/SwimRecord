class RecordsController < ApplicationController
  before_action :authenticate_user!
def index
  @users = User.all
  @records= current_user.records.all
end
def new
  @record = Record.new
  @swim_items = SwimItem.all
  @swim_distances = SwimDistance.all
  @atheletes = Athelete.all
  @contests = Contest.all
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

def update
  @record = Record.find(params[:id])
     if @record.update(record_params)
       redirect_to records_path, notice: "修改成功"
     else
       render :edit
     end
   
end

def edit
  @record = Record.find(params[:id])
  @swim_items = SwimItem.all
  @swim_distances = SwimDistance.all
  @atheletes = Athelete.all
  @contests = Contest.all
end

def destroy
  @record = Record.find(params[:id])
  @record.destroy
  redirect_to records_path, alert:"record deleted"
end
def record_params
  params.require(:record).permit(:owner_id, :swim_item_id, :distance_id, :contest_id, :minutes, :seconds, :month, :date, :year)
end


end
