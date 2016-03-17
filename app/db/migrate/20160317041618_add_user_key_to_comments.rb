class AddUserKeyToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :userId
    add_reference :comments, :user, index: true
    add_foreign_key :uploads, :users
  end
end
