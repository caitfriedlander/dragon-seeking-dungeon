class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  
    before_action :authorize, except: [:index, :show]

    def index
      if params[:search]
        edition = params[:edition] == '' ? '%' : params[:edition]
        @campaigns = Campaign.joins(:edition).where("campaigns.name ILIKE ? OR campaigns.description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").where("editions.name LIKE '#{edition}'").order(created_at: :desc)
        if params[:online].present?
          val = params[:online] == "true" ? true : false 
          @campaigns = @campaigns.where(online: val)
        end
      else
        @campaigns = Campaign.all
      end
    end

    def show
      @campaign = Campaign.find(params[:id])
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
      if @campaign.save
        redirect_to @campaign
      else
        render :new
      end
    end

    def update
      if @campaign.update_attributes(campaign_params)
        redirect_to campaign_path
      else
        render edit_path
      end
    end

    def destroy
      @user = current_user
      @campaign.destroy
      redirect_to @user
    end
  
    private
      def set_campaign
        @campaign = Campaign.find(params[:id])
      end
  
      def campaign_params
        params.require(:campaign).permit(:name, :online, :size, :description, :full, :edition_id)
      end
  end
  