class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.integer :account
      t.float :in_assets
      t.float :in_passive
      t.float :credit
      t.float :debit 
      t.float :out_assets
      t.float :out_passive

      t.timestamps
    end
  end
end
