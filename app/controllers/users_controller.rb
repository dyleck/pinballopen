class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new, :create, :activate, :index, :edit, :update, :request_password_reset, :process_password_reset]
  before_action :authorize_this_user_only, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @matches_played_by_player = Match.joins(:scores).where("scores.user_id" => @user.id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def request_password_reset
    @user = User.new
  end

  def process_password_reset
    @user = User.find_by_email(user_params[:email])
    if not @user
      flash[:type] = :danger
      flash[:message] = "Email not registered."
      redirect_to password_url
      return false
    end
    @user.regenerate_token
    UserNotifier.pass_reset(@user).deliver
    flash[:type] = :success
    flash[:message] = "Check your inbox for password reset instruction."
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new set_player_role # TODO this is bad!
    @user.tournaments << Tournament.first # TODO fix fixed tournmanet assignemt

    respond_to do |format|
      if @user.save
        UserNotifier.created(@user).deliver
        format.html { render action: 'create' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # get /users/:id/activate
  def activate
    if params[:token]
      @user = User.find_by_token(params[:token])
      if not @user.active? and @user.id == params[:user_id].to_i
        respond_to do |format|
          if @user.update active: true
            session[:user_id] = @user.id
            UserNotifier.activated(@user).deliver
            format.html { redirect_to @user, notice: 'Your account is activated now. Thanks' }
          else
            format.html { redirect_to root_url }
          end
        end
      end
    else
      redirect_to root_url
    end
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update user_params
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :nationality_id, :password, :password_confirmation, :email, :roles => [] )
    end

    def convert_roles_to_objects
      params = user_params
      params[:roles].map! do |role|
        if not role.empty?
          Role.find(role)
        end
      end.compact!
      params
    end

    def set_player_role
      params = user_params
      params[:roles] = [Role.find_by_name('Player')]
      params
    end

    def authorize_this_user_only
      user = User.find(params[:id])
      if user.token and params[:token] == user.token
        session[:user_id] = params[:id]
        user.token = nil
        user.save
        return true
      end
      redirect_to login_url, notice: 'Permission denied' if session[:user_id] != @user.id
    end
end
