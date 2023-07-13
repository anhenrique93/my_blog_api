class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :pt_name, null: false
      t.string :en_name, null: true

      t.timestamps
    end
  end
end
