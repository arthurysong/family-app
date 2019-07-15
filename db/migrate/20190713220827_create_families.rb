class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.string :last_name
      t.string :password_digest
    end
  end
end
