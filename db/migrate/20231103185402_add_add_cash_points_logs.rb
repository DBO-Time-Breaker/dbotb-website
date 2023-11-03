class AddAddCashPointsLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :add_cash_points_logs do |t|
      t.integer :account_id, null: false
      t.string :reason, null: false
      t.integer :cash_points, null: false
      t.integer :admin_id, null: false

      t.timestamps
    end
  end
end
