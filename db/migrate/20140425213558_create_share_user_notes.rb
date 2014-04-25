class CreateShareUserNotes < ActiveRecord::Migration
  def change
    create_table :share_user_notes do |t|
      t.integer :user_id
      t.integer :note_id
      t.timestamps
    end
  end
end
