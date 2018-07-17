class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  
    before_action :authorize, except: [:index, :show]

    def index
      @campaigns = Campaign.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @campaign = Campaign.new
      @editions = Edition.all
    end

    def edit
    end

    def create
      @campaign = Campaign.new(campaign_params)
      @campaign.user = current_user
      @campaign.full = false
      if @campaign.save
        redirect_to @campaign
      else
        render :new
      end
    end

    def update
      respond_to do |format|
        if @campaign.update(campaign_params)
          format.html { redirect_to @campaign, notice: 'campaign was successfully updated.' }
          format.json { render :show, status: :ok, location: @campaign }
        else
          format.html { render :edit }
          format.json { render json: @campaign.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @campaign.destroy
      respond_to do |format|
        format.html { redirect_to campaigns_url, notice: 'campaign was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      def set_campaign
        @campaign = Campaign.find(params[:id])
      end
  
      def campaign_params
        params.require(:campaign).permit(:name, :online, :size, :description, :full, :edition_id)
      end
  end
  