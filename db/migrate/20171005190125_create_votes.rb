class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :voteable, polymorphic:true
      t.string :voteable_type

      t.timestamps
    end
  end
end
