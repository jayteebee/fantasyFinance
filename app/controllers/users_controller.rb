class UsersController < ApplicationController
    before_action :set_user, except: [:create_profile]
    skip_before_action :verify_authenticity_token, only: [:delete_profile, :create_profile]


# **** GET METHODS ****

    # def personal_details
    #     @user = User.find(params[:user_id])
    # end

# Get all information about a user
    def show_profile
        #@user = User.find(params[:user_id])
        render json: @user
    end

# **** POST METHODS ****

# Create a new user profile
def create_profile
    @user = User.new(user_params)
    if @user.save
        render json: @user, status: :created
    else
        render json: @user.errors, status: :unprocessable_entity
    end
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

def user_params
    params.require(:user).permit(:name, :age, :email, :trading_style, :experience_level, :balance)
end