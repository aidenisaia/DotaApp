class ItemsController < ApplicationController

  def index
    response = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetGameItems/V001/?key=#{Rails.application.credentials.api_key}&language=LANGCODE").parse(:json)["result"]["items"]

    response_items = []
    response.each do |item|
      if item["recipe"] == 0
        response_items << item
      end
    end

    response_items.each do |item|
      item["name"] = item["name"].sub('item_', '')
      item["url"] = "http://cdn.dota2.com/apps/dota2/images/items/#{item['name']}_lg.png"
    end
    
    render json: { 
      items: Item.all,
      response_items: response_items
    }
  end

end
