
  class MoodsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:create, :show, :find]

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

    def find
      user = User.find(find_params[:user_id])
      
      moods_arr = user.moods
      mood_obj = {}
      moods_arr.each do |mood|
        # byebug
        mood_date = "#{mood[:time].year}/#{mood[:time].month}/#{mood[:time].day}"
        mood_time = "#{mood[:time].to_s.split(" ")[1]}"
        # byebug
        if mood_obj[mood_date]
          mood_obj[mood_date].push({id: mood.id, hour: mood_time})
          # key already exists
          # the value of key is an array
          # push this mood's id into the array at this  key
        else
          mood_obj[mood_date] = [{id: mood.id, hour: mood_time}]

        end
      end

        render json: mood_obj
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

    def find_params
      {:user_id => Auth.decode(params[:user_id])["user_id"]}
    end
  end
