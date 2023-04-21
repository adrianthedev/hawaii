class CreateSuperDuperTrooperUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :super_duper_trooper_users do |t|

      t.timestamps
    end
  end
end
