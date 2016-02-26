class ChangeDateOfBirthColumnForEmployee < ActiveRecord::Migration
  def change
    reversible do |change|
      change.up do
        change_column :employees, :date_of_birth, :date
      end

      change.down do
        change_column :employees, :date_of_birth, :datetime
      end
    end

  end
end
