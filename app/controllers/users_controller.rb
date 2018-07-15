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
    end
  
    def edit
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "You have signed up!"
        redirect_to users_path
      else 
        render :new
      end
    end
  
    def update

    end
  
    def destroy

    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = user.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :age, :gender, :zipcode)
      end
end