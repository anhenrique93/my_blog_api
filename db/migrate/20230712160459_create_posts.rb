class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :pt_title
      t.string :en_title
      t.string :pt_excerpt
      t.string :en_excerpt
      t.string :pt_body
      t.string :en_body
      t.string :author
      t.date :date

      t.timestamps
    end
  end
end
