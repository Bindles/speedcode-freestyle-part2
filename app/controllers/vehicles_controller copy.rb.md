class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all

    if params[:color].present?
      @vehicles = @vehicles.where(color: params[:color])
    end

    if params[:make].present?
      @vehicles = @vehicles.where(make: params[:make])
    end
  end
end
