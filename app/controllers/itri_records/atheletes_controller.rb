class ItriRecords::AtheletesController < ApplicationController

  helper_method :get_male_or_female
  def index
    @atheletes = Athelete.all
  end
  def new
    @athelete = Athelete.new
  end
  def create
    @athelete = Athelete.new(athelete_params)
    if @athelete.save
      redirect_to itri_records_atheletes_path
    else
      render :new
    end
  end

  def show

  end

  def update
    @athelete = Athelete.find(params[:id])
       if @athelete.update(athelete_params)
         redirect_to itri_records_atheletes_path, notice: "修改成功"
       else
         render :edit
       end

  end

  def edit
    @athelete = Athelete.find(params[:id])
  end

  def destroy
    @athelete = Athelete.find(params[:id])
    @athelete.destroy
    redirect_to itri_records_atheletes_path, alert:"athelete deleted"
  end

  def get_male_or_female(is_male)
    if(is_male)
      return "male"
    else
      return "female"
    end
  end
  private
  def athelete_params
    params.require(:athelete).permit(:name, :sex)
  end
end
