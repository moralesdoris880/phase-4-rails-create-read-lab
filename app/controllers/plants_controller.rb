class PlantsController < ApplicationController
    wrap_parameters format: []
    def index
        render json: Plant.all
    end

    def show
        plant = Plant.find_by(id:params[:id])
        if plant
            render json: plant, status: :ok
        else
            render json: {error: "Error"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(params.permit(:name,:image,:price))
        render json: plant, status: :created
    end



end
