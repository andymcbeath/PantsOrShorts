class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.as_json
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      location: params[:location],
      temp_preference: params[:temp_preference],
    )
    user.save
    render json: user.as_json
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user.as_json
  end

  def update
    user = User.find_by(id: params[:id])
    user.name = params[:name] || user.name
    user.email = params[:email] || user.email
    user.password = params[:password] || user.password
    user.location = params[:location] || user.location
    user.temp_preference = params[:temp_preference] || user.temp_preference
    user.save
    render json: user.as_json
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: { message: "User has been destroyed!" }
  end
end
