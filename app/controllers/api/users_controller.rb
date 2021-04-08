class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render :json => @users.to_a.as_json
  end

  def show
    if @user.present?
      render :json => @user.as_json
    else
      render :json => {error: "Record not found"}
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :json => @user.as_json 
    else
      render :json => @user.errors
    end
  end

  def update
    if @user.update(user_params)
      render :json => @user.as_json 
    else
      render :json => @user.errors
    end
  end

  def destroy
    if @user.destroy
      render :json => {}
    else
      render :json => {error: "Unable to destroy"}
    end
  end
  
  def typeahead
    @users = User.where('$or' => [{"firstName" => /.*#{params[:input]}.*/i}, {"lastName": /.*#{params[:input]}.*/i}, {"email" => /.*#{params[:input]}.*/i}]).to_a

    render :json => @users.as_json  
  end

  private

  def user_params
    params.require(:user).permit(:firstName, :lastName, :email)
  end

  def set_user
    @user = User.find(params[:id].to_i)
  end

end