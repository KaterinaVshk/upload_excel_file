class CreateNamesClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :names_classes do |t|
      t.text :name
      t.timestamps
    end
  end
end
