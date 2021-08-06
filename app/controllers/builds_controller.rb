class BuildsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def index
    render json: Build.all
  end

  def create
    response = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key=6F50BFED48FF88F023D59F09DCC715C3").parse(:json)

    build = Build.new(
      user_id: current_user.id,
      hero_name: response["result"]["heroes"].filter{|hero| hero["name"] == "npc_dota_hero_#{params[:hero_name]}"}.first["name"],
      timing: params[:timing]
    )
    if build.save
      render json: {message: "build created"}, status: :created
    else
      render json: { errors: build.errors.full_messages }, status: :bad_request
    end
  end

end
