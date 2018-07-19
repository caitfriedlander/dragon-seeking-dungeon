class RemoveFullFromCampaigns < ActiveRecord::Migration[5.2]
  def change
    remove_column :campaigns, :full, :boolean
  end
end
