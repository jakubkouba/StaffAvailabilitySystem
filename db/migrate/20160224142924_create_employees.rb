class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, limit: 64, null: false
      t.string :surname, limit: 64, null: false
      t.datetime :date_of_birth, null: false
      t.string :email, limit: 64, null: false
      t.integer :shirt_size, limit: 2, default: 0
      t.string :password_hash, limit: 128, null:false
      t.string :password_salt, limit: 128, null: false
      t.datetime :last_login

      t.timestamps null: false
    end
  end
end
