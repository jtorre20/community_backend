# module V1
  class UsersController < ApplicationController
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
    @user = User.new(user_params)
      if @user.save
        redirect_to 'http://localhost:3001/'
      else
        render 'new'
      # render json: new_user
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
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
  
  end
# end
