class CreateJoinTableEmployeeStaffTypes < ActiveRecord::Migration
  def change
    create_join_table :employees, :staff_types, table_name: :positions do |t|
      t.index :employee_id
      t.index :staff_type_id
    end
  end
end
