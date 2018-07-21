# module V1
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:create]
    def index
      render json: User.all
    end

    def new
      @user = User.new
    end
  
    def show
      user = User.find(params[:id])
      render json: user
    end
  
    def create
      # :users
      # byebug
    @user = User.new(user_params)
      if @user.save
        token = Auth.issue({user_id: @user.id})
        render json: {user: token, status: "success"}
      
      else
        render 'new'
      end
    end
  
    def destroy
      User.destroy(params[:id])
    end
  
    def update
      user = User.find(params[:id])
      user.update_attributes(user_params)
      render json: user
    end
  
    private
      def user_params
        params.permit(:name, :email, :password, :password_confirmation)
      end
  
  end
# end
