class CreateJoinTableEmployeeAccessLevel < ActiveRecord::Migration
  def change
    create_join_table :employees, :access_levels, table_name: :authorizations do |t|
      t.index :employee_id
      t.index :access_level_id
    end
  end
end
