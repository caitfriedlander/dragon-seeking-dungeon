class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  
    before_action :authorize, except: [:index, :show]

    def index
      # search
      if params[:search]
        edition = params[:edition] == '' ? '%' : params[:edition]
        @campaigns = Campaign.joins(:edition).where("campaigns.name ILIKE ? OR campaigns.description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").where("editions.name LIKE '#{edition}'").order(created_at: :desc)
        
      else
        @campaigns = Campaign.all
      end
    end

    def show
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
  