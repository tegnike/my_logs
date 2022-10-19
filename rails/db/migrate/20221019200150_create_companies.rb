class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true, null: false, comment: 'ユーザーID'
      t.string :name, null: false, comment: '名前'

      t.timestamps
    end
  end
end
