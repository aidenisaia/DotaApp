class BuildsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def index
    response = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key=#{Rails.application.credentials.api_key}").parse(:json)["result"]["heroes"]

    heroes = []
    response.each do |hero|
      heroes << hero
    end

    heroes.each do |hero|
      hero["name"] = hero["name"].sub('npc_dota_hero_', '')
      hero["url"] = "http://cdn.dota2.com/apps/dota2/images/heroes/#{hero['name']}_sb.png"
    end

    response2 = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetGameItems/V001/?key=#{Rails.application.credentials.api_key}&language=LANGCODE").parse(:json)["result"]["items"]

    response_items = []
    response2.each do |item|
      if item["recipe"] == 0
        response_items << item
      end
    end

    response_items.each do |item|
      item["name"] = item["name"].sub('item_', '')
      item["url"] = "http://cdn.dota2.com/apps/dota2/images/items/#{item['name']}_lg.png"
    end

    
    render json: { 
      builds: Build.all,
      heroes: heroes,
      response_items: response_items
    }
  end

  def show
    render json: Build.find_by(id: params[:id])
  end

  # def update
  #   build = Build.find_by(id: params[:id], user_id: current_user.id)
    
  #   build.title = params[:title] || build.title
  #   build.body = params[:body] || build.body
  #   build.build_id = params[:build_id] || build.build_id

  #   if build.save
  #     render json: build
  #   end
  # end

  def create
    response = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key=#{Rails.application.credentials.api_key}").parse(:json)

    # if params[:hero_name]

    build = Build.new(
      user_id: current_user.id,
      hero_name: params[:hero_name],
      timing: params[:timing],
      hero_url: params[:hero_url]
    )
    if build.save
      params[:itemchoices].each do |itemchoice|
        item = Item.new(
          item_name: itemchoice[:name],
          build_id: build.id,
          url: itemchoice[:url]
        )
        item.save
      end
      render json: {message: "build created"}, status: :created
    else
      render json: { errors: build.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    build = Build.find_by(id: params[:id], user_id: current_user.id)

    if build.delete
      build.items.each do |item|
        item.delete
      end
      render json: {message: "Build and items were deleted"}
    end
  end

end
