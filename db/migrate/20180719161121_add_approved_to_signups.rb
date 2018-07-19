class AddApprovedToSignups < ActiveRecord::Migration[5.2]
  def change
    add_column :signups, :approved, :boolean, default: false
  end
end
