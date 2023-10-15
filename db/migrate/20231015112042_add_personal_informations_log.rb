class AddPersonalInformationsLog < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_informations_logs do |t|
      t.integer :account_id, null: false
      t.string :field
      t.string :old_value
      t.string :new_value

      t.timestamps
    end
  end
end
