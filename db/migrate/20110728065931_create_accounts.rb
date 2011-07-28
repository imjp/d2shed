class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :mule_name
			t.string :realm
      t.references :user

      t.timestamps
    end
    add_index :accounts, :user_id
  end
end
