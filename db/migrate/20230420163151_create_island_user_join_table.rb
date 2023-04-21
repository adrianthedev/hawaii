class CreateIslandUserJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :islands, :users do |t|
      # t.index [:island_id, :user_id]
      # t.index [:user_id, :island_id]
    end
  end
end
