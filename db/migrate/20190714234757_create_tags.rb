class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :content
      t.integer :board_id
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
