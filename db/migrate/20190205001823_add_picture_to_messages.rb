class AddPictureToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :picture, :string
  end
end
