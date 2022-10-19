class Salary < ApplicationRecord
  belongs_to :company

  enum currency: { jpy: 0, pln: 1 }
  enum calc_type: { hourly_wage: 0, daily_wage: 1, monthly_wage: 2 }
end
