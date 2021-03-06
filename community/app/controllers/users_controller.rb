# module V1
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:create, :show]
    def index
      render json: User.all
    end

    def new
      @user = User.new
    end
  
    def show
      
      user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        token = Auth.issue({user_id: user.id})
        render json: {user: token, status: "success"}
      # else 
        # render {status: "failure"}
      end
    end
  
    def create
    @user = User.new(user_params)
      if @user.save
        token = Auth.issue({user_id: @user.id})
        render json: {user: token, status: "success"}
      
      # else
      #   render {status: "failure"}
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
        params.permit(:username, :email, :password, :password_confirmation)
      end
  
  end
# end
