class Api::V1::GamelevelsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index, :create]
  def index
    levels = Gamelevel.all
    render json: levels
  end

  def create
    gamelevel = Gamelevel.new(level_params)
    if gamelevel.save
      render json: gamelevel, status: 201
    else
      render json: {errors: gamelevel.errors}, status: 422
    end
  end

  private
    
    def level_params
      params.require(:gamelevel).permit(:num_enemies, :num_balls, :num_hits_per_enemy)
    end
end
