class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all.order(id: :asc)
  end

  def import
    begin
      Facility.import(params[:file])
      binding.irb
      redirect_to admin_facilities_path, notice: '更新しました。'
    rescue => error
      flash[:alert] = "#{error.message}"
      redirect_to admin_facilities_path
    end
    # binding.irb
  end

end
