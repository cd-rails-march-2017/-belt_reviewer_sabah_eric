class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :string
      t.string :lname
      t.string :email
      t.string :city
      t.string :state
      t.string :password

      t.timestamps null: false
    end
  end
end
