class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all.order(id: :asc)
  end
end
