class AddPositionToTodoItem < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :position, :integer
  end
end
