class AddUserIdToRizins < ActiveRecord::Migration[6.1]
  def change
    add_column :rizins, :user_id, :integer
  end
end
