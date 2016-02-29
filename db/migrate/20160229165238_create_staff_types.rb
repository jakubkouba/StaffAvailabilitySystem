class CreateStaffTypes < ActiveRecord::Migration
  def change
    create_table :staff_types do |t|
      t.string :title, limit: 64
    end
  end
end
