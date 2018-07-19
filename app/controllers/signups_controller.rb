class SignupsController < ApplicationController

    def index
        @campaigns = current_user.campaigns
    end

    def show
        @signup = Signup.find(params[:id])
    end

    def create
        @signup = Signup.new
        @signup.user = current_user
        @signup.campaign_id = params[:campaign_id]
        @signup.save
        redirect_to campaign_path(params[:campaign_id])
    end

    def update
        @signup = Signup.find(params[:id])
        @signup.approved = true
        @signup.save
        redirect_to notifications_path
    end

    def destroy
        @signup = Signup.find(params[:id])
        dm = @signup.campaign.user == current_user
        @signup.destroy
        redirect_to (dm ? notifications_path : campaigns_path)
    end

end