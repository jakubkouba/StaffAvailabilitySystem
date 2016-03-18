class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.belongs_to :employee, index: true
      t.date :day, null: false
      t.time :time_from, null: false
      t.time :time_to, null: false

      t.timestamps null: false
    end
  end
end
