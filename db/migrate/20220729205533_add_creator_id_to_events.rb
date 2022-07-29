class AddCreatorIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :users, column: :creator_id, null: false, foreign_key: true
  end
end
