class AddEditionRefToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_reference :campaigns, :edition, foreign_key: true
  end
end
