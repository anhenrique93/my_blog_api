class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :image
      t.string :pt_description
      t.string :en_description
      t.string :password_digest

      t.timestamps
    end
  end
end
