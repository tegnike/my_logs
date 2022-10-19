# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(
  email: "test@test.coms",
  password: "password",
  password_confirmation: "password",
  name: "太郎"
)
2.times do |n|
  company = Company.create!(
    user: user,
    name: "会社名#{n}"
  )
  Salary.create!(
    company: company,
    start_date: Date.parse('2020-01-01'),
    end_date: Date.parse('2020-12-31'),
    amount: 2500,
    currency: :jpy,
    calc_type: :hourly_wage
  )
  Salary.create!(
    company: company,
    start_date: Date.parse('2021-01-01'),
    end_date: Date.parse('2021-12-31'),
    amount: 2700,
    currency: :jpy,
    calc_type: :hourly_wage
  )
  Salary.create!(
    company: company,
    start_date: Date.parse('2022-01-01'),
    end_date: Date.parse('2099-12-31'),
    amount: 3000,
    currency: :jpy,
    calc_type: :hourly_wage
  )
  [*0..2].each do |n|
    amount = 0
    work_time = 0
    [*1..12].each do |m|
      monthly_income = MonthlyIncome.create!(
        user: user,
        company: company,
        target_month: Date.parse("202#{n}-#{m}-01"),
        amount: "#{[*40..60].sample}0000",
        work_time: [*160..210].sample
      )
      amount += monthly_income.amount
      work_time += monthly_income.work_time
    end
    AnnualIncome.create!(
      user: user,
      company: company,
      target_year: Date.parse("202#{n}-01-01"),
      amount: amount,
      work_time: work_time
    )
  end
end
