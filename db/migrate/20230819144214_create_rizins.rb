class CreateRizins < ActiveRecord::Migration[6.1]
  def change
    create_table :rizins do |t|
      t.string :brand1
      t.integer :price1
      t.string :name1

      t.timestamps
    end
  end
end
