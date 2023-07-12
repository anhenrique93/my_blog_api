class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :pt_name
      t.string :en_name

      t.timestamps
    end
  end
end
