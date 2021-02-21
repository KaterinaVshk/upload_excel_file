class AddColumnToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :datum_id, :integer
  end
end
