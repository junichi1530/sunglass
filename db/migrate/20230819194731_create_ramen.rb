class CreateRamen < ActiveRecord::Migration[6.1]
  def change
    create_table :ramen do |t|
      t.string :brand2
      t.integer :price2
      t.string :name2

      t.timestamps
    end
  end
end
