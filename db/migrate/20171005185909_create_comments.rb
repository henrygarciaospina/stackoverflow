class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :commentable, foreign_key: true
      t.string :commentable_type

      t.timestamps
    end
  end
end
