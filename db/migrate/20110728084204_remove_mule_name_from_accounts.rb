class RemoveMuleNameFromAccounts < ActiveRecord::Migration
  def up
		remove_column :accounts, :mule_name
  end

  def down
  end
end
