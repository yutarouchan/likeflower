class AddUserIdToVariety < ActiveRecord::Migration[6.1]
  def change
    add_column :varieties, :user_id, :integer
  end
end
