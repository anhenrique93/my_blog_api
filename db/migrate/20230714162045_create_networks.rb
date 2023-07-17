class CreateNetworks < ActiveRecord::Migration[7.0]
  def change
    create_table :networks do |t|
      t.string :name
      t.string :url
      t.belongs_to :profile, foreign_key: true

      t.timestamps
    end
  end
end
