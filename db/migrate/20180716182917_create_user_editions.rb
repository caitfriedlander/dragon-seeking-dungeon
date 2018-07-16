class CreateUserEditions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_editions do |t|
      t.references :user, foreign_key: true
      t.references :edition, foreign_key: true

      t.timestamps
    end
  end
end
