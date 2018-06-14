class Api::UsersController < ApplicationController
  def create 
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password_digest: params[:password_digest],
      address: params[:address],
      city: params[:city],
      zip: params[:zip]
      )
    @user.save 
    render "show.json.jbuilder"
  end 
end
