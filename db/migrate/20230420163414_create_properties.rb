class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.references :island, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.string :coordinates

      t.timestamps
    end
  end
end
