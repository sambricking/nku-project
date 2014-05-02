class AddOwnerEmailShare < ActiveRecord::Migration
  def change
    add_column :share_user_notes, :email, :string
    add_column :share_user_notes, :owner, :string 
  end
end
