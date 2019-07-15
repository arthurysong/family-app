class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :title
      t.integer :user_id
      t.integer :family_id
    end
  end
end
