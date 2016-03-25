class RemoveIdFromAvailabilities < ActiveRecord::Migration
  def change
    remove_column :availabilities, :id, :integer
  end
end
