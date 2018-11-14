class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.references :client, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
