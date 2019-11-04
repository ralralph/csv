class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
  end

  def import
    Facility.import(params[:file])
    redirect_to facilities_url
  end

end
