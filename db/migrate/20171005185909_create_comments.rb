class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic:true, foreign_key: true
      t.string :commentable_type
      t.text :body

      t.timestamps
    end
  end
end
