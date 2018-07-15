class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.integer :age
      t.string :gender
      t.string :email
      t.integer :zipcode
      t.boolean :active
      t.string :password_digest

      t.timestamps
    end
  end
end
