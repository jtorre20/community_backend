module V1
  class MoodsController < ApplicationController

    def index
      render json: Mood.all
    end
  
    def show
      mood = Mood.find(params[:id])
      render json: mood
    end
  
    def create
      
   
    new_mood = Mood.create()
      render json: new_mood
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
      params.require(:mood).permit(:user_id, :time,
          :category,
          :intensity,
          :location,
          :impact)
    end
  end
end
