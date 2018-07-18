class SignupsController < ApplicationController

    def create
        @signup = Signup.new
        @signup.user = current_user
        @signup.campaign_id = params[:campaign_id]
        @signup.save
        redirect_to campaign_path(params[:campaign_id])
    end

    def index
        @signup = Campaign.where(params[:user_id] = current_user)
    end

end