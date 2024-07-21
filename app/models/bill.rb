class Bill < ApplicationRecord
  belongs_to :submitted_employee, class_name: 'Employee'

  def self.total_amount
    sum(:amount)
  end
end
