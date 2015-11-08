class AddEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :text, default: false
  end
end
