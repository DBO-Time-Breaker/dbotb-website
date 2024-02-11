class AddDownloadLinksTable < ActiveRecord::Migration[7.0]
  def change
    create_table :download_links do |t|
      t.integer :provider, null: false
      t.string :link, null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
