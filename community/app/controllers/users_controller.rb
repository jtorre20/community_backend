# module V1
  class UsersController < ApplicationController
    def index
      render json: User.all
    end

    def new

    end
  
    def show
      user = User.find(params[:id])
      render json: user
    end
  
    def create
      
    new_user = User.create(user_params)
      render json: new_user
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
      params.require(:user).permit(:name, :email)
    end
  end
# end
