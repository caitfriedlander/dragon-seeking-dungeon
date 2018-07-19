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
        # if Signup.find(params[:cid])
        #     @signup = Signup.find(params[:id])
        #     @campaign = Campaign.where(id: @signup.campaign_id)
        #     if @signup.destroy
        #         players = Signup.where(campaign_id: @campaign.id).length
        #         @campaign.full = false
        #     end
        #     redirect_to notifications_path
        # else
        #     @campaign = Campaign.find(params[:id])
        #     @signup = Signup.where(campaign_id: @campaign.id).where(user_id: current_user)
        #     @signup.destroy_all
        #     if @signup.destroy_all
        #         players = Signup.where(campaign_id: @campaign.id).length
        #         @campaign.full = false
        #     end
    end

end