class ChangeFromAndToDateTime < ActiveRecord::Migration
  def change
    change_column :availabilities, :time_from, :datetime
    change_column :availabilities, :time_to, :datetime
  end
end
