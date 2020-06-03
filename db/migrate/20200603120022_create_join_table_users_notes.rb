class CreateJoinTableUsersNotes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :notes do |t|
      t.index [:user_id, :note_id]
      t.index [:note_id, :user_id]

      t.string :role
      t.timestamps
    end
  end
end
