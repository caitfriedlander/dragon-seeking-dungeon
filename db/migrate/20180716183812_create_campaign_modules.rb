class CreateCampaignModules < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_modules do |t|
      t.references :campaign, foreign_key: true
      t.references :story_module, foreign_key: true

      t.timestamps
    end
  end
end
