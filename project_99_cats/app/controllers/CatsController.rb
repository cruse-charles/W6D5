class CatsController < ApplicationController
    
    def index
        @cats = Cat.all
        render json: @cats
    end

    def create
        @cat = Cat.new(cat_params)

        if @cat.save!
            render json: @cat
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

    def show
        render json: Cat.find(params[:id])
    end

    def update
        @cat = Cat.find(params[:id])

        if @cat.update(cat_params)
            render json: @cat
        else
            render json: @cat.error.full_messages, status: 422
        end
    end



    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end
end