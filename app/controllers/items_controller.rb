class ItemsController < ApplicationController
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

    items = []
    response2.each do |item|
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
      heroes: heroes,
      items: items
    }
  end

end
