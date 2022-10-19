class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.references :company, foreign_key: true, null: false, comment: '会社ID'
      t.date :start_date, null: false, comment: '開始日'
      t.date :end_date, null: false, comment: '終了日'
      t.integer :amount, null: false, comment: '金額'
      t.integer :currency, null: false, comment: '通貨'
      t.integer :calc_type, null: false, comment: '計算タイプ'

      t.timestamps
    end
  end
end
