class ChangeFirstNameForUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :first_name, :string, :default => "(No Name)"
  end
end
