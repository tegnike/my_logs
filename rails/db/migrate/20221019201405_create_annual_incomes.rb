class CreateAnnualIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :annual_incomes do |t|
      t.references :user, foreign_key: true, null: false, comment: 'ユーザーID'
      t.references :company, foreign_key: true, comment: '会社ID'
      t.string :name, comment: '名称'
      t.date :target_year, null: false, comment: '対象年'
      t.integer :amount, null: false, comment: '金額'
      t.integer :work_time, comment: '稼働時間'
      t.text :note, comment: '備考'

      t.timestamps
    end
  end
end
