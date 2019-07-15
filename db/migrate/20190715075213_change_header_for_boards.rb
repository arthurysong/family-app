class ChangeHeaderForBoards < ActiveRecord::Migration[5.2]
  def change
    change_column :boards, :header, :string, :default => "(No Header)"
  end
end
