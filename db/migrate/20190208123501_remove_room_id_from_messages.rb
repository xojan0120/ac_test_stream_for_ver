class RemoveRoomIdFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :room_id, :string
  end
end
