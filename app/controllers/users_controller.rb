class UsersController < ApplicationController

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      address: params[:address]
    )
    if @user.save
      render "show.json.jbuilder"
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    puts "*******************"
    p current_user
    @user = current_user
    render 'show.json.jbuilder'
  end

  def update
    @user = current_user

    @user.first_name = params[:first_name] || @user.first_name
    @user.first_name = params[:last_name] || @user.last_name
    @user.first_name = params[:email] || @user.email
    @user.first_name = params[:address] || @user.address

    @user.save

    render 'show.json.jbuilder'
  end 
end
