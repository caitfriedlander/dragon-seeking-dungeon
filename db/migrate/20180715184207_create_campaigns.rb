class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.boolean :online
      t.integer :size
      t.text :description
      t.boolean :full

      t.timestamps
    end
  end
end
