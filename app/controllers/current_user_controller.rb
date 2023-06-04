class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  
  def index
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end
end