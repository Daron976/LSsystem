class UsersController < ApplicationController
  before_action :authorize_request, except: %i[create login]

  # GET /users/{username}
  def show
    user = User.find_by_email(params[:_username])
    render json: user, status: :ok
  end

  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages },
             status: :unprocessable_entity
    end
  end
  
  # POST /auth/login
  def login
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
      email: user.email }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  # DELETE /users/{username}
  def destroy
    user = User.find_by_email(params[:_username])
    user.destroy
  end

  private

  def params
    params.permit(
      :username, :email, :password
    )
  end

  def login_params
    params.permit(
      :email, :password
    )
  end
end