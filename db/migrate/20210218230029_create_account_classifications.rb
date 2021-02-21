class CreateAccountClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :account_classifications do |t|
      t.integer :group_account
      t.integer :id_class
      t.timestamps
    end
  end
end
