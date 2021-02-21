class AddFileForData < ActiveRecord::Migration[6.0]
  def up
    add_attachment :data, :file_attch
  end

  def down
    remove_attachment :data, :file_attch
  end
end
