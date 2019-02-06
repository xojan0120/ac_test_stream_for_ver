class AddRoomIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :room_id, :integer
  end
end
