# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionFix
  before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token, only: [:create]
  respond_to :json
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
 
def create
  super
end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:age, :email, :password ])
  end


  # def handle_options_request
  #   headers['Access-Control-Allow-Origin'] = 'https://fantasy-finance-fe-416b523c0162.herokuapp.com'
  #   headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS, DELETE, PUT, PATCH'
  #   headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  #   head :ok
  # end

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: {code: 200, message: 'Logged in sucessfully.'},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end



end
