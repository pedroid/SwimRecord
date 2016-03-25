class RecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @records= current_user.records.all
  end

  def show

  end
end
