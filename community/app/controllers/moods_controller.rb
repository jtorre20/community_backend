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
      RestClient.post(url,{text:"this is testdata tothe api"}, {"X-AYLIEN-TextAPI-Application-Key": "73ead8b493c2bff21192d56d9709a188", "X-AYLIEN-TextAPI-Application-ID": "3d781275", "Content-Type": "application/json",Accept: "application/json"})
   
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
      params.require(:mood).permit(:token, :time,
          :category,
          :intensity,
          :input
          )
    end
  end
end
