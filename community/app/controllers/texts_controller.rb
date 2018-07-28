class TextsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :show]

    def index
      render json: Text.all
    end
  
    def show
      text = Text.find(params[:id])
      render json: text
    end

    def text_analysis

    end
  
    def create
      url = "https://api.aylien.com/api/v1/sentiment"
      result = RestClient.post(url,{mode:params[:mode], language:params[:language], text:params[:text]}, {"X-AYLIEN-TextAPI-Application-Key": "73ead8b493c2bff21192d56d9709a188", "X-AYLIEN-TextAPI-Application-ID": "3d781275", "Content-Type": "application/json",Accept: "application/json"})
      parsed_result = JSON.parse(result)
      # byebug
      render json: {text: parsed_result}
    end
  
    def destroy
      Text.destroy(params[:id])
    end
  
    def update
      text = Text.find(params[:id])
      text.update_attributes(text_params)
      render json: text
    end
  
    private
  
    def text_params
        {:user_id => Auth.decode(params[:user_id])["user_id"], 
          :text => params[:text],  
          :language => params[:language],
          :mode => params[:mode]
        }
          
    end
end
