class SignupsController < ApplicationController

    def index
        @campaigns = current_user.campaigns
    end

    def show
        @signup = Signup.find(params[:id])
    end

    def create
        @signup = Signup.new
        @campaign = Campaign.find(params[:campaign_id])
        @signup.user = current_user
        @signup.campaign_id = params[:campaign_id]
        @signup.save
        redirect_to campaign_path(params[:campaign_id])
    end

    def update
        @signup = Signup.find(params[:id])
        @signup.approved = true
        @signup.save
        if @signup.save
            players = Signup.where(campaign_id: @campaign.id).length
            if (players == @campaign.size)
                @campaign.full = true
                @campaign.save
            end
        end
        redirect_to notifications_path
    end

    def destroy
        if Campaign.find(params[:campaign_id])
            @signup = Signup.find(params[:id])
            @campaign = Campaign.where(id: @signup.campaign_id)
            if @signup.destroy
                players = Signup.where(campaign_id: @campaign.id).length
                @campaign.full = false
            end
            redirect_to notifications_path
        else
            @campaign = Campaign.find(params[:id])
            @signup = Signup.where(campaign_id: @campaign.id).where(user_id: current_user)
            @signup.destroy_all
            if @signup.destroy_all
                players = Signup.where(campaign_id: @campaign.id).length
                @campaign.full = false
            end
            redirect_to campaigns_path
        end
    end

end