class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[ show update destroy ]

  # GET /planets
  def index
    planets = Planet.all
    render json: planets
  end

  def show
    render json: @planet
  end

  def create
    planet = Planet.create!(plant_params)
    if planet
      render json: planet, status: :created
    else
      render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end
  end

  def update
    if @planet 
      if @planet.update(planet_params_update)
        render json: @planet, status: :accepted
      else
        render json: { errors: @planet.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: ["Planet not found"] }, status: :not_found
    end
  end

  def destroy
    if @planet
      @planet.destroy
      head.destroy
    else
      render json: { error: "Planet not found" }, status: :not_found
    end
  end

  
  private
  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
    params.permit(:name, :distance_from_earth, :nearest_star, :image)
  end

  def planet_params_update
    params.permit(:name, :distance_from_earth, :nearest_star, :image)
  end

end
