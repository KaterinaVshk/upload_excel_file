class CreateGroupings < ActiveRecord::Migration[6.0]
  def change
    create_table :groupings do |t|
      t.integer :account 
      t.integer :group_account 

      t.timestamps
    end
  end
end
