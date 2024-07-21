# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
departments = ['Engineering', 'Sales', 'Marketing']

departments.each do |name|
  Department.find_or_create_by!(name: name)
end

employee = Employee.find_or_create_by!(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com') do |emp|
  emp.designation = 'Developer'
  emp.department = Department.find_by(name: 'Engineering')
end

# Seed example bills with specific bill types using the first employee
bill_types = ['Food', 'Travel', 'Medical', 'Office Supplies']

bill_types.each do |type|
  Bill.find_or_create_by!(amount: rand(10..100), bill_type: type, submitted_employee: employee)
end
