class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :pt_title, null: false
      t.string :en_title, null: true
      t.string :pt_excerpt, null: false
      t.string :en_excerpt, null: true
      t.string :pt_body, null: false
      t.string :en_body, null: true
      t.string :author, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
