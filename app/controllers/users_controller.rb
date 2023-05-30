class UsersController < ApplicationController
    
    # def personal_details
    #     @user = User.find(params[:user_id])
    # end

    def profile
        @user = User.find(params[:user_id])
    end
end
