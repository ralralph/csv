class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all.order(id: :asc)
  end

  def import
    begin
      Facility.import(params[:file])
    rescue => error
      @error = error
    end
    redirect_to facilities_url
  end

end
