json.extract! bill, :id, :amount, :bill_type, :submitted_employee_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
