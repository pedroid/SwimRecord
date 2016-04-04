class RecordsController < ApplicationController
  before_action :authenticate_user!
def index
  @users = User.all
  @records= current_user.records.all.order("updated_at DESC")
  @swim_items = SwimItem.all
  @swim_distances = SwimDistance.all
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
  @users = User.all
  @records= current_user.records.all.order("updated_at DESC")
  @swim_items = SwimItem.all
  @swim_distances = SwimDistance.all
  if valid_page?
    render params[:id]
  else
    render file:"public/404.html", status: :not_found
  end
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
private
def record_params
  params.require(:record).permit(:owner_id, :swim_item_id, :distance_id, :contest_id, :minutes, :seconds, :month, :date, :year)
end
def valid_page?
  File.exist?(Pathname.new(Rails.root + "app/views/records/#{params[:id]}.html.erb"))
end
def get_swim_item_collection

 swim_item_collection = []
 i=1
 @swim_items.each do |swim_item|
   swim_item_collection << [swim_item.name, i]
   i=i+1
 end
 return swim_item_collection
end

def get_record_owner_collection
  record_owner_collection = []
  i=1
  @atheletes.each do |athelete|
    record_owner_collection << [athelete.name,i]
    i = i+1
  end
  return record_owner_collection
end

def get_swim_item_collection
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
