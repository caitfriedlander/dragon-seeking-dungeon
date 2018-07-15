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
        params.require(:user).permit(:email, :username, :age, :gender, :zipcode, :password, :password_confirmation)
      end
end