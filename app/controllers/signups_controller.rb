class SignupsController < ApplicationController



    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created
    end

private

def activity_params
    params.permit(:time, :camper_id, :activity_id)
end    

end
