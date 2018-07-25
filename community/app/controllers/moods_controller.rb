
  class MoodsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:create, :show]

    def index
      render json: Mood.all
    end
  
    def show
      mood = Mood.find(params[:id])
      render json: mood
    end
  
    def create
      url = "https://api.aylien.com/api/v1/sentiment"
      new_mood = Mood.create(mood_params)
      # byebug
      result = RestClient.post(url,{mode:params[:mode], language:params[:language], text:params[:text]}, {"X-AYLIEN-TextAPI-Application-Key": "73ead8b493c2bff21192d56d9709a188", "X-AYLIEN-TextAPI-Application-ID": "3d781275", "Content-Type": "application/json",Accept: "application/json"})
      render json: {mood: result}
    end
  
    def destroy
      Mood.destroy(params[:id])
    end
  
    def update
      mood = Mood.find(params[:id])
      mood.update_attributes(mood_params)
      render json: mood
    end
  
    private
  
    def mood_params
      # user_id = Auth.decode(params[:user_id])["user_id"]
        {:user_id => Auth.decode(params[:user_id])["user_id"], 
          :text => params[:text], 
          :mood => params[:mood], 
          :language => params[:language],
          :mode => params[:mode],
          :time => params[:time]
        }
          
    end
  end
