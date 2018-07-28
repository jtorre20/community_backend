
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
      new_mood = Mood.create(mood_params)
      # result = JSON.parse(new_mood)
      # byebug
      render json: {moods: new_mood}
      
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
      mood_object = 
        {anger: params[:mood]['anger'], 
          fear: params[:mood]['fear'],
        disgust: params[:mood]['disgust'],
        happiness: params[:mood]['happiness'], 
        surprise: params[:mood]['surprise'],
        sadness: params[:mood]['sadness'], 
        contempt: params[:mood]['contempt']}
        
        {:user_id => Auth.decode(params[:user_id])["user_id"], 
          :mood => mood_object, 
          :time => params[:time]
        }
          
    end
  end
