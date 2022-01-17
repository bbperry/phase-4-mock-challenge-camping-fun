class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def index
        render json: Activity.all
    end

    def destroy
        activity = find_activity
        activity.destroy
        head :no_content
    end

    
    private 
    
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Activity not found" }, status: :not_found
      end

    def find_activity
        Activity.find(params[:id])
    end
    
    def activity_params
        params.permit(:name, :difficulty)
    end    
end
