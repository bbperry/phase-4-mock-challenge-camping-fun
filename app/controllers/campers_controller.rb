class CampersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def index
        render json: Camper.all
    end

    def show
        camper = find_camper
        render json: camper
      end
    
    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    
    private 
    
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "camper not found" }, status: :not_found
      end

    def find_camper
        Camper.find(params[:id])
    end
    
    def camper_params
        params.permit(:name, :age)
    end    
    
end

