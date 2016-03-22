class PagesController < ApplicationController
  def index

  end
  
  def show
    if valid_page?
      render params[:id]
    else
      render file:"public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:id]}.html.erb"))
  end
end
