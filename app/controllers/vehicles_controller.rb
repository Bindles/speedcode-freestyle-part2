class VehiclesController < ApplicationController
  def indexjs
    # Start the query for all vehicles
    @vehicles = Vehicle.all

    # Filter by 'make' if provided in the query parameters
    if params[:make].present?
      @vehicles = @vehicles.where(make: params[:make])
    end

    # Filter by 'color' if provided in the query parameters
    if params[:color].present?
      @vehicles = @vehicles.where(color: params[:color])
    end

    # Get distinct makes and colors for the dropdown options
    @possible_makes = Vehicle.distinct.pluck(:make).sort
    @possible_colors = Vehicle.distinct.pluck(:color).sort

    # Check for Turbo Stream (HX-Request in Laravel)
    if request.headers["xxx"]
      # Return just the table component as a partial
      render partial: "vehicles/vehicles", locals: { vehicles: @vehicles }
    else
      # Full page render with the vehicles and dropdowns
      render :index
    end
  end

  def indext
    @vehicles = Vehicle.all # .where(type: "Bike")
    @vehicles = @vehicles.where(color: params[:color]) if params[:color].present?
    @vehicles = @vehicles.where(make: params[:make]) if params[:make].present?

    # respond_to do |format|
    #   format.html # For regular page load
    #   format.turbo_stream # For Turbo stream requests (AJAX)
    # end
    # respond_to do |format|
    #   format.js { render partial: "vehicles/vehicle", locals: { vehicles: @vehicles } } # For AJAX requests
    #   format.html # For regular page load
    # end#
  end

  def index
    @vehicles = Vehicle.all

    if params[:color].present?
      @vehicles = @vehicles.where(color: params[:color])
    end

    if params[:make].present?
      @vehicles = @vehicles.where(make: params[:make])
    end

    # redirect_to indexm_vehicles_path
  end
end
