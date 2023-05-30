class UsersController < ApplicationController
    before_action :set_user
    skip_before_action :verify_authenticity_token, only: [:delete_profile]


# **** GET METHODS ****

    # def personal_details
    #     @user = User.find(params[:user_id])
    # end

# Get all information about a user
    def show_profile
        #@user = User.find(params[:user_id])
        render json: @user
    end

# ***** DELETE METHODS ****

def delete_profile
    # @user = User.find(params[:user_id])
    @user.destroy
    render json: {message: "User deleted"}
end

end

private

def set_user
    @user = User.find(params[:user_id])
rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
end
