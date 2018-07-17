class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # before_action :authorize, except: [:index, :show]

    def index
      @users = User.all
    end

    def show
    end
  
    def new
      @user = User.new
      @editions = Edition.all
      @roles = Role.all
    end
  
    def edit
      @editions = Edition.all
      @roles = Role.all
    end

    def create
      @user = User.new(user_params)
      @user.image.attach(params[:user][:image])
      @editions = Edition.all
      @roles = Role.all
      if @user.save
        session[:user_id] = @user.id
        redirect_to users_path
      else 
        render :new
      end
    end
  
    def update
      current_user.user_editions.destroy_all
      current_user.user_roles.destroy_all
      params[:editions].each do |edition_id|
        UserEdition.create(user: current_user, edition_id: edition_id)
      end
      params[:roles].each do |role_id|
        UserRole.create(user: current_user, role_id: role_id)
      end
      if current_user.update_attributes(user_params)
        redirect_to current_user
      else
        render :edit
      end
    end
  
    def destroy

    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :age, :gender, :zipcode, :bio)
      end
end