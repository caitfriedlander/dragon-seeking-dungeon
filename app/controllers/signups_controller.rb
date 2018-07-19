class SignupsController < ApplicationController

    def create
        @signup = Signup.new
        @campaign = Campaign.find(params[:campaign_id])
        @signup.user = current_user
        @signup.campaign_id = params[:campaign_id]
        @signup.save
        if @signup.save
            players = Signup.where(campaign_id: @campaign.id).length
            p '*' *100
            p players
            p @campaign.size
            p @campaign.full
            p '*' *100
            if (players == @campaign.size)
                @campaign.full = true
            end
            p '*' *100
            p @campaign.full
            p '*' *100
        end
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
        if @signup.destroy_all
            players = Signup.where(campaign_id: @campaign.id).length
            @campaign.full = false
        end
        redirect_to campaigns_path
    end

end