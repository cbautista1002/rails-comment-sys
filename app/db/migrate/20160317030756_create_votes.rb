class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :userId
      t.integer :commentId
      t.integer :action

      t.timestamps null: false
    end
  end
end
