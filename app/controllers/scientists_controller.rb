class ScientistsController < ApplicationController

    before_action :one_scientist, only: [:show, :update, :destroy]


    def index
        render json: Scientist.all
    end

    def show
        render json: @scientist, serializer: ScientistPlanetSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        if scientist
            render json: scientist, status: :created
        else
            render json: { errors: ["valididation erros"]}, status: :unprocessable_entity
        end
        
    end

    def update
        if @scientist
            if @scientist.update!(scientist_params_update)
                render json: @scientist, status: :accepted
            else
                render json: { errors: ["validation errors"]}, status: :unprocessable_entity
            end
        else
            render json: { errors: ["Scientitst not found"]}, stauts: :not_found
        end
    end

    def destroy
        if @scientist
            @scientist.destroy
            head :no_content, status: :deleted
        else
            render json: {error: "Scientist not found"}, status: :not_found
        end
    end

    private

    def one_scientist
        @scientist = Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def scientist_params_update
        params.permit(:name, :field_of_study, :avatar)
    end
end
