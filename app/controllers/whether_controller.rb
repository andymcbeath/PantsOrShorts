class WhetherController < ApplicationController
  def index
    response = HTTP.get("http://api.weatherapi.com/v1/current.json?key=c1e2720106c64235991183618220209&q=#{params[:search_term]}&aqi=no")
    render json: response.parse(:json)
  end
end
