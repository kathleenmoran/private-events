class RemoverUserFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :users_id
  end
end
