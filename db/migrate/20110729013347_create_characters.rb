class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :type
      t.references :account

      t.timestamps
    end
    add_index :characters, :account_id
  end
end
