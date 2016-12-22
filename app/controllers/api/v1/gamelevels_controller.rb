class Api::V1::GamelevelsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index]
  def index
    levels = Gamelevel.all
    render json: levels
  end
end
