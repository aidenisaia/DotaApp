class BuildsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def index
    response = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetGameItems/V001/?key=#{Rails.application.credentials.api_key}&language=LANGCODE").parse(:json)["result"]["items"]

    items = []
    response.each do |item|
      if item["recipe"] == 0
        items << item
      end
    end

    items.each do |item|
      item["name"] = item["name"].sub('item_', '')
      item["url"] = "http://cdn.dota2.com/apps/dota2/images/items/#{item['name']}_lg.png"
    end

    
    render json: { 
      builds: Build.all,
      heroes: HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key=#{Rails.application.credentials.api_key}").parse(:json)["result"]["heroes"],
      items: items
    }
  end

  def create
    response = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key=#{Rails.application.credentials.api_key}").parse(:json)

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
