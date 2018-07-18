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

    def destroy
        @campaign = Campaign.find(params[:id])
        @signup = Signup.where(campaign_id: @campaign.id).where(user_id: current_user)
        p '*' * 100
        p @signup
        @signup.destroy_all

        redirect_to campaigns_path
    end

end