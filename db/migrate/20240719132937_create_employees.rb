class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :designation
      t.references :submitted_employee, null: false, foreign_key: { to_table: :employees }

      t.timestamps
    end
  end
end
