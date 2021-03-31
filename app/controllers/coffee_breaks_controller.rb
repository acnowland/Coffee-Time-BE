class CoffeeBreaksController < ApplicationController
    def index
        @breaks = CoffeeBreak.all
        render json: @breaks
    end

    def create
        @break = CoffeeBreak.create_mutual_coffee_break(params[:user_1_id], params[:user_2_id])

        render json: @break
    end
    
end
