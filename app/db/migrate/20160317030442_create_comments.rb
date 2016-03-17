class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :userId
      t.integer :articleId
      t.integer :parentId

      t.timestamps null: false
    end
  end
end
