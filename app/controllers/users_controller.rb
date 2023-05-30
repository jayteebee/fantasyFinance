class UsersController < ApplicationController
    before_action :set_user
    # def personal_details
    #     @user = User.find(params[:user_id])
    # end

# Get all information about a user
    def profile
        # @user = User.find(params[:user_id])
        render json: @user
    end
end

private

def set_user
    @user = User.find(params[:user_id])
rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
end
end