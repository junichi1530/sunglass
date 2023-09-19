class AddImage1ToRizins < ActiveRecord::Migration[6.1]
  def change
    add_column :rizins, :image1, :string
  end
end
