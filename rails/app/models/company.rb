class Company < ApplicationRecord
  belongs_to :user
  has_many :salaries
  has_many :monthly_incomes
  has_many :annual_incomes
end
