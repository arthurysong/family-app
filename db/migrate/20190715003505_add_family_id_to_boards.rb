class AddFamilyIdToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :family_id, :integer
  end
end
